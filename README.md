# twilio-ruby

[![Build Status](https://img.shields.io/travis/twilio/twilio-ruby.svg)][travis]
[![Gem Version](https://img.shields.io/gem/v/twilio-ruby.svg)](https://rubygems.org/gems/twilio-ruby)
[![Learn with TwilioQuest](https://img.shields.io/static/v1?label=TwilioQuest&message=Learn%20to%20contribute%21&color=F22F46&labelColor=1f243c&style=flat-square&logo=data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAIAAAACACAMAAAD04JH5AAAASFBMVEUAAAAZGRkcHBwjIyMoKCgAAABgYGBoaGiAgICMjIyzs7PJycnMzMzNzc3UoBfd3d3m5ubqrhfrMEDu7u739/f4vSb/3AD///9tbdyEAAAABXRSTlMAAAAAAMJrBrEAAAKoSURBVHgB7ZrRcuI6EESdyxXGYoNFvMD//+l2bSszRgyUYpFAsXOeiJGmj4NkuWx1Qeh+Ekl9DgEXOBwOx+Px5xyQhDykfgq4wG63MxxaR4ddIkg6Ul3g84vCIcjPBA5gmUMeXESrlukuoK33+33uID8TWeLAdOWsKpJYzwVMB7bOzYSGOciyUlXSn0/ABXTosJ1M1SbypZ4O4MbZuIDMU02PMbauhhHMHXbmebmALIiEbbbbbUrpF1gwE9kFfRNAJaP+FQEXCCTGyJ4ngDrjOFo3jEL5JdqjF/pueR4cCeCGgAtwmuRS6gDwaRiGvu+DMFwSBLTE3+jF8JyuV1okPZ+AC4hDFhCHyHQjdjPHUKFDlHSJkHQXMB3KpSwXNGJPcwwTdZiXlRN0gSp0zpWxNtM0beYE0nRH6QIbO7rawwXaBYz0j78gxjokDuv12gVeUuBD0MDi0OQCLvDaAho4juP1Q/jkAncXqIcCfd+7gAu4QLMACCLxpRsSuQh0igu0C9Svhi7weAGZg50L3IE3cai4IfkNZAC8dfdhsUD3CgKBVC9JE5ABAFzg4QL/taYPAAWrHdYcgfLaIgAXWJ7OV38n1LEF8tt2TH29E+QAoDoO5Ve/LtCQDmKM9kPbvCEBApK+IXzbcSJ0cIGF6e8gpcRhUDogWZ8JnaWjPXc/fNnBBUKRngiHgTUSivSzDRDgHZQOLvBQgf8rRt+VdBUUhwkU6VpJ+xcOwQUqZr+mR0kvBUgv6cB4+37hQAkXqE8PwGisGhJtN4xAHMzrsgvI7rccXqSvKh6jltGlrOHA3Xk1At3LC4QiPdX9/0ndHpGVvTjR4bZA1ypAKgVcwE5vx74ulwIugDt8e/X7JgfkucBMIAr26ndnB4UCLnDOqvteQsHlgX9N4A+c4cW3DXSPbwAAAABJRU5ErkJggg==)](https://twil.io/learn-open-source)

## Documentation

The documentation for the Twilio API can be found [here][apidocs].

The Ruby library documentation can be found [here][libdocs] and individual releases [here][refdocs].

## Recent Update

As of release 5.1.0, Beta and Developer Preview products are now exposed via
the main `twilio-ruby` artifact. Releases of the `alpha` branch have been
discontinued.

If you were using the `alpha` release line, you should be able to switch back
to the normal release line without issue.

If you were using the normal release line, you should now see several new
product lines that were historically hidden from you due to their Beta or
Developer Preview status. Such products are explicitly documented as
Beta/Developer Preview both in the Twilio docs and console, as well as through
in-line code documentation here in the library.

## Installation

To install using [Bundler][bundler] grab the latest stable version:

```ruby
gem 'twilio-ruby', '~> 5.29.0'
```

To manually install `twilio-ruby` via [Rubygems][rubygems] simply gem install:

```bash
gem install twilio-ruby -v 5.29.0
```

To build and install the development branch yourself from the latest source:

```bash
git clone git@github.com:twilio/twilio-ruby.git
cd twilio-ruby
make install
```

## Versions

`twilio-ruby` uses a modified version of [Semantic Versioning](https://semver.org) for all changes. [See this document](VERSIONS.md) for details.

### Migration from 4.x

[Upgrade Guide][upgrade]

## Docker Image

The `Dockerfile` present in this repository and its respective `twilio/twilio-ruby` Docker image are currently used by Twilio for testing purposes only.

## Getting help

If you need help installing or using the library, please check the [Twilio Support Help Center](https://support.twilio.com) first, and [file a support ticket](https://twilio.com/help/contact) if you don't find an answer to your question.

If you've instead found a bug in the library or would like new features added, go ahead and open issues or pull requests against this repo!

## Getting Started

### Setup Work

```ruby
require 'twilio-ruby'

# put your own credentials here
account_sid = 'ACxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
auth_token = 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'

# set up a client to talk to the Twilio REST API
@client = Twilio::REST::Client.new account_sid, auth_token
```

### Make a Call

```ruby
@client.calls.create(
  from: '+14159341234',
  to: '+16105557069',
  url: 'http://example.com'
)
```

### Send an SMS

```ruby
@client.messages.create(
  from: '+14159341234',
  to: '+16105557069',
  body: 'Hey there!'
)
```

### List your SMS Messages

```ruby
@client.messages.list(limit: 20)
```

### Fetch a single SMS message by Sid

```ruby
# put the message sid you want to retrieve here:
message_sid = 'SMxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
@client.messages(message_sid).fetch
```

### Customizing your HTTP Client

`twilio-ruby` uses [Faraday][faraday] to make HTTP requests. You can tell `Twilio::REST::Client` to use any of the Faraday adapters like so:

```ruby
@client.http_client.adapter = :typhoeus
```

### Handling Errors

```ruby
begin
  messages = @client.messages.list(limit: 20)
rescue Twilio::REST::TwilioError => e
  puts e.message
end
```

### Getting Started With Client Capability Tokens

If you just need to generate a Capability Token for use with Twilio Client, you can do this:

```ruby
require 'twilio-ruby'

# put your own account credentials here:
account_sid = 'ACxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
auth_token = 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'

# set up
capability = Twilio::JWT::ClientCapability.new account_sid, auth_token

# allow outgoing calls to an application
outgoing_scope = Twilio::JWT::ClientCapability::OutgoingClientScope.new 'AP11111111111111111111111111111111'
capability.add_scope(outgoing_scope)

# allow incoming calls to 'andrew'
incoming_scope = Twilio::JWT::ClientCapability::IncomingClientScope.new 'andrew'
capability.add_scope(incoming_scope)

# generate the token string
@token = capability.to_s
```

There is a slightly more detailed document in the [Capability][capability] section of the wiki.

### Generating TwiML

To control phone calls, your application needs to output [TwiML][twiml].

You can construct a TwiML response like this:

```ruby
require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new do |r|
  r.say(message: 'hello there', voice: 'alice')
  r.dial(caller_id: '+14159992222') do |d|
    d.client 'jenny'
  end
end

# print the result
puts response.to_s
```

This will print the following (except for the whitespace):

```xml
<?xml version="1.0" encoding="UTF-8"?>
<Response>
  <Say voice="alice">hello there</Say>
  <Dial callerId="+14159992222">
    <Client>jenny</Client>
  </Dial>
</Response>
```

## Supported Ruby Versions

This library supports and is [tested against][travis] the following Ruby implementations:

- Ruby 2.6.X
- Ruby 2.5.X
- Ruby 2.4.X

[apidocs]: https://www.twilio.com/docs/api
[twiml]: https://www.twilio.com/docs/api/twiml
[libdocs]: https://www.twilio.com/docs/libraries/ruby
[refdocs]: https://twilio.github.io/twilio-ruby
[capability]: https://github.com/twilio/twilio-ruby/wiki/JWT-Tokens
[examples]: https://github.com/twilio/twilio-ruby/blob/master/examples
[wiki]: https://github.com/twilio/twilio-ruby/wiki
[bundler]: https://bundler.io
[rubygems]: https://rubygems.org
[gem]: https://rubygems.org/gems/twilio
[travis]: https://travis-ci.org/twilio/twilio-ruby
[upgrade]: https://github.com/twilio/twilio-ruby/wiki/Ruby-Version-5.x-Upgrade-Guide
[issues]: https://github.com/twilio/twilio-ruby/issues
[faraday]: https://github.com/lostisland/faraday
