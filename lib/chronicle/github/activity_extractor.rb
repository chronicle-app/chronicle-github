require 'chronicle/etl'
require 'octokit'

module Chronicle
  module Github
    class ActivityExtractor < Chronicle::ETL::Extractor
      register_connector do |r|
        r.source = :github
        r.type = :activity
        r.strategy = :api
        r.description = 'github activity'
      end

      setting :access_token, required: true
      setting :username

      def prepare
        @client = ::Octokit::Client.new(access_token: @config.access_token)
        @access_token_owner = @client.user
      end

      def extract
        events = @client.user_events(username)
        has_more = events.any?
        count = 0

        while has_more
          events = events.first(@config.limit - count) if @config.limit
          events = events.filter { |event| event.created_at > @config.since } if @config.since

          break unless events.any?

          events.each do |event|
            count += 1
            yield build_extraction(data: event, meta: { user: @user })
          end

          break unless @client.last_response.rels[:next]

          events = @client.get(@client.last_response.rels[:next].href)
          has_more = events.any?
        end
      end

      private

      def username
        @config.username || @access_token_owner.login
      end
    end
  end
end
