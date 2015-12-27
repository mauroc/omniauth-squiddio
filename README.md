OmniAuth sQuiddio
================
Work in Progress

This gem is an OmniAuth Strategy for the [Squiddio API](https://github.com/mauroc/signalk-oauth-node/blob/master/API.md) which uses OAuth 2.0

Usage
-----

Obtain SQUIDDIO_KEY and SQUIDDIO_SECRET:
Create a sQuidd.io account at http://squidd.io/signup if you don't already have one. Create a boat (it will be needed to obtain an auth Client ID and Secret for your SignalK server). Update your boat's current position (some of the sample API requests require a known vessel position).

Add the strategy to your `Gemfile` alongside OmniAuth:

```ruby
gem 'omniauth'
gem 'omniauth-squiddio'
```

Then, to integrate the strategy into your middleware, add this to your omniauth.rb settings file:

```ruby
use OmniAuth::Builder do
  provider :squiddio, ENV['SQUIDDIO_KEY'], ENV['SQUIDDIO_SECRET']
end
```

In Rails, you'll want to add to the middleware stack:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :squiddio, ENV['SQUIDDIO_KEY'], ENV['SQUIDDIO_SECRET']
end
```

If you use Devise:

```ruby
Devise.setup do |config|
  config.omniauth :squiddio, ENV['SQUIDDIO_KEY'], ENV['SQUIDDIO__SECRET']
end
```

For additional information, refer to the [OmniAuth wiki](https://github.com/intridea/omniauth/wiki).

