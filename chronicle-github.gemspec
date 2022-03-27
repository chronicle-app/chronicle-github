# frozen_string_literal: true

require_relative "lib/chronicle/github/version"

Gem::Specification.new do |spec|
  spec.name = "chronicle-github"
  spec.version = Chronicle::Github::VERSION
  spec.authors = ["Andrew Louis"]
  spec.email = ["andrew@hyfen.net"]

  spec.summary = "Github connectors for Chronicle-ETL"
  spec.description = "Extract github user event stream, repository events, and more"
  spec.homepage = "https://github.com/chronicle-app/chronicle-github"
  spec.required_ruby_version = ">= 2.7.0"
  spec.license = "MIT"

  spec.metadata['allowed_push_host'] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/chronicle-app/chronicle-github"
  spec.metadata["changelog_uri"] = "https://github.com/chronicle-app/chronicle-github/releases"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "chronicle-etl", "~> 0.5"
  spec.add_dependency "octokit", "~> 4.0"
end
