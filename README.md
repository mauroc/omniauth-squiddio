OmniAuth sQuiddio
================
Work in Progress

This gem is an OmniAuth Strategy for the [Squiddio API](https://github.com/mauroc/signalk-oauth-node/blob/master/API.md) which uses OAuth 2.0

Usage
-----

Add the strategy to your `Gemfile` alongside OmniAuth:

```ruby
gem 'omniauth'
gem 'omniauth-squiddio'
```

Then integrate the strategy into your middleware:

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

