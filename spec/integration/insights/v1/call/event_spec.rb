##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

require 'spec_helper.rb'

describe 'Event' do
  it "can read" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.insights.v1.calls('CAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                         .events.list()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://insights.twilio.com/v1/Voice/CAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Events',
    ))).to eq(true)
  end

  it "receives read responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "meta": {
              "page": 0,
              "page_size": 50,
              "first_page_url": "https://insights.twilio.com/v1/Voice/CAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Events?PageSize=50&Page=0",
              "previous_page_url": null,
              "next_page_url": null,
              "key": "events",
              "url": "https://insights.twilio.com/v1/Voice/CAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Events?PageSize=50&Page=0"
          },
          "events": [
              {
                  "timestamp": "2019-09-19T22:15:23Z",
                  "call_sid": "CA03a02b156c6faa96c86906f7e9ad0f38",
                  "account_sid": "AC998c10b68cbfda9f67277f7d8f4439c9",
                  "edge": "sdk_edge",
                  "group": "connection",
                  "name": "error",
                  "level": "ERROR",
                  "sdk_edge": {
                      "error": {
                          "code": 31600
                      },
                      "metadata": {
                          "client_name": "GTI9300323095d271b890c91568931321395",
                          "location": {
                              "lat": 37.4192,
                              "lon": -122.0574
                          },
                          "city": "Mountain View",
                          "country_code": "US",
                          "country_subdivision": "California",
                          "ip_address": "108.177.7.83",
                          "sdk": {
                              "type": "twilio-voice-android",
                              "version": "4.5.1",
                              "platform": "android",
                              "selected_region": "gll",
                              "os": {
                                  "name": "android",
                                  "version": "4.3"
                              },
                              "device": {
                                  "model": "GT-I9300",
                                  "type": "GT-I9300",
                                  "vendor": "samsung",
                                  "arch": "armeabi-v7a"
                              }
                          }
                      }
                  },
                  "client_edge": null,
                  "carrier_edge": null,
                  "sip_edge": null,
                  "gateway": null,
                  "client": null
              }
          ]
      }
      ]
    ))

    actual = @client.insights.v1.calls('CAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                .events.list()

    expect(actual).to_not eq(nil)
  end

  it "receives read_deep responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "meta": {
              "page": 10,
              "page_size": 5,
              "first_page_url": "https://insights.twilio.com/v1/Voice/CAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Events?PageSize=5&Page=0",
              "previous_page_url": "https://insights.twilio.com/v1/Voice/CAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Events?PageSize=5&Page=9&PageToken=DP10",
              "next_page_url": null,
              "key": "events",
              "url": "https://insights.twilio.com/v1/Voice/CAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Events?PageSize=5&Page=10"
          },
          "events": [
              {
                  "timestamp": "2019-09-19T22:15:23Z",
                  "call_sid": "CA03a02b156c6faa96c86906f7e9ad0f38",
                  "account_sid": "AC998c10b68cbfda9f67277f7d8f4439c9",
                  "edge": "sdk_edge",
                  "group": "connection",
                  "name": "error",
                  "level": "ERROR",
                  "sdk_edge": {
                      "error": {
                          "code": 31600
                      },
                      "metadata": {
                          "client_name": "GTI9300323095d271b890c91568931321395",
                          "location": {
                              "lat": 37.4192,
                              "lon": -122.0574
                          },
                          "city": "Mountain View",
                          "country_code": "US",
                          "country_subdivision": "California",
                          "ip_address": "108.177.7.83",
                          "sdk": {
                              "type": "twilio-voice-android",
                              "version": "4.5.1",
                              "platform": "android",
                              "selected_region": "gll",
                              "os": {
                                  "name": "android",
                                  "version": "4.3"
                              },
                              "device": {
                                  "model": "GT-I9300",
                                  "type": "GT-I9300",
                                  "vendor": "samsung",
                                  "arch": "armeabi-v7a"
                              }
                          }
                      }
                  },
                  "client_edge": null,
                  "carrier_edge": null,
                  "sip_edge": null,
                  "gateway": null,
                  "client": null
              }
          ]
      }
      ]
    ))

    actual = @client.insights.v1.calls('CAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                .events.list()

    expect(actual).to_not eq(nil)
  end
end