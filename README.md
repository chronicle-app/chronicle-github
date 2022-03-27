# Chronicle::Github
[![Gem Version](https://badge.fury.io/rb/chronicle-github.svg)](https://badge.fury.io/rb/chronicle-github)

Extract your Github history using the command line with this plugin for [chronicle-etl](https://github.com/chronicle-app/chronicle-etl)

## Available Connectors
### Extractors
- `activity` - Extractor for a user's recent events

### Transformers
- Pending

## Usage

```sh
# Install chronicle-etl and this plugin
$ gem install chronicle-etl
$ chronicle-etl connectors:install github

# You can get a Github personal access token from https://github.com/settings/tokens
$ chronicle-etl secrets:set github access_token FOO123

# Extract github events from the last 10 days
$ chronicle-etl --extractor github:activity --since 10d
```
