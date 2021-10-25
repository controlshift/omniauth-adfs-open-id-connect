# Active Directory Federation Services OpenID Connect

OAuth 2 authentication with [AD FS OpenID Connect API](https://docs.microsoft.com/en-us/windows-server/identity/ad-fs/overview/ad-fs-openid-connect-oauth-flows-scenarios) from the engineering team at [ControlShift](https://www.controlshiftlabs.com/).

This gem code is mostly based on the [`omniauth-azure-activedirectory-v2`](https://github.com/RIPAGlobal/omniauth-azure-activedirectory-v2) gem, and has been updated to work with on-premises AD FS deployments.

[![CI Status](https://github.com/controlshift/omniauth-adfs-open-id-connect/actions/workflows/ci.yml/badge.svg)](https://github.com/controlshift/omniauth-adfs-open-id-connect/actions/workflows/ci.yml)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'omniauth-adfs-open-id-connect'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install omniauth-adfs-open-id-connect

## Usage

After setting up the new application in AD FS, add a new OmniAuth provider to your application as follows:

```
use OmniAuth::Builder do
  provider :adfs_openid_connect,
    {
      client_id: ENV['ADFS_CLIENT_ID'],
      client_secret: ENV['ADFS_CLIENT_SECRET'],
      base_adfs_url: ENV['ADFS_BASE_URL']
    }
end
```

## Development

After checking out the repo, run `bundle install` to install dependencies. Then, run `rake spec` to run the tests.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/controlshift/omniauth-adfs-open-id-connect. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Active Directory Federation Services OpenID Connect project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/controlshift/omniauth-adfs-open-id-connect/blob/master/CODE_OF_CONDUCT.md).
