OmniAuth sQuiddio
================
Work in Progress

This gem is an OmniAuth Strategy for the [Squiddio API](https://github.com/mauroc/signalk-oauth-node/blob/master/API.md) which uses OAuth 2.0

Usage
-----

Obtain app key and secret (SQUIDDIO_KEY, SQUIDDIO_SECRET):
* Create a sQuidd.io account at http://squidd.io/signup if you don't already have one.
* Create a Boat (app credentials are associated to a user's vessel, not the user, in case you own/manage multiple vessels).
* Update your boat's current position (some of the sample API requests require a known vessel position).
* Finally, go to your boat's page and click "Edit Boat Profile". You can find the ID and Secret in the Profile Tab.
More info in the [Getting Started Guide](http://squidd.io/getting_started) and [FAQ](http://squidd.io/faq)

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

