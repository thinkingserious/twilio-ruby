##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

require 'spec_helper.rb'

describe 'Verification' do
  it "can create" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.verify.v2.services('VAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                       .verifications.create(to: 'to', channel: 'channel')
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {'To' => 'to', 'Channel' => 'channel', }
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'post',
        url: 'https://verify.twilio.com/v2/Services/VAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Verifications',
        data: values,
    ))).to eq(true)
  end

  it "receives create_verification responses" do
    @holodeck.mock(Twilio::Response.new(
        201,
      %q[
      {
          "sid": "VEaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "service_sid": "VAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "to": "+15017122661",
          "channel": "sms",
          "status": "pending",
          "valid": false,
          "date_created": "2015-07-30T20:00:00Z",
          "date_updated": "2015-07-30T20:00:00Z",
          "lookup": {
              "carrier": {
                  "error_code": null,
                  "name": "Carrier Name",
                  "mobile_country_code": "310",
                  "mobile_network_code": "150",
                  "type": "mobile"
              }
          },
          "amount": null,
          "payee": null,
          "url": "https://verify.twilio.com/v2/Services/VAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Verifications/VEaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
      }
      ]
    ))

    actual = @client.verify.v2.services('VAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                              .verifications.create(to: 'to', channel: 'channel')

    expect(actual).to_not eq(nil)
  end

  it "receives create_verification_email responses" do
    @holodeck.mock(Twilio::Response.new(
        201,
      %q[
      {
          "sid": "VEaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "service_sid": "VAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "to": "mail@email.com",
          "channel": "email",
          "status": "pending",
          "valid": false,
          "date_created": "2015-07-30T20:00:00Z",
          "date_updated": "2015-07-30T20:00:00Z",
          "lookup": {
              "carrier": {
                  "error_code": null,
                  "name": null,
                  "mobile_country_code": null,
                  "mobile_network_code": null,
                  "type": null
              }
          },
          "amount": null,
          "payee": null,
          "url": "https://verify.twilio.com/v2/Services/VAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Verifications/VEaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
      }
      ]
    ))

    actual = @client.verify.v2.services('VAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                              .verifications.create(to: 'to', channel: 'channel')

    expect(actual).to_not eq(nil)
  end

  it "receives create_verification_with_rate_limits responses" do
    @holodeck.mock(Twilio::Response.new(
        201,
      %q[
      {
          "sid": "VEaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "service_sid": "VAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "to": "+15017122661",
          "channel": "sms",
          "status": "pending",
          "valid": false,
          "date_created": "2015-07-30T20:00:00Z",
          "date_updated": "2015-07-30T20:00:00Z",
          "lookup": {
              "carrier": {
                  "error_code": null,
                  "name": "Carrier Name",
                  "mobile_country_code": "310",
                  "mobile_network_code": "150",
                  "type": "mobile"
              }
          },
          "amount": null,
          "payee": null,
          "url": "https://verify.twilio.com/v2/Services/VAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Verifications/VEaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
      }
      ]
    ))

    actual = @client.verify.v2.services('VAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                              .verifications.create(to: 'to', channel: 'channel')

    expect(actual).to_not eq(nil)
  end

  it "can update" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.verify.v2.services('VAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                       .verifications('sid').update(status: 'canceled')
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {'Status' => 'canceled', }
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'post',
        url: 'https://verify.twilio.com/v2/Services/VAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Verifications/sid',
        data: values,
    ))).to eq(true)
  end

  it "receives update_verification responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "sid": "VEaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "service_sid": "VAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "to": "+15017122661",
          "channel": "sms",
          "status": "canceled",
          "valid": false,
          "date_created": "2015-07-30T20:00:00Z",
          "date_updated": "2015-07-30T20:00:00Z",
          "lookup": {
              "carrier": {
                  "error_code": null,
                  "name": "Carrier Name",
                  "mobile_country_code": "310",
                  "mobile_network_code": "150",
                  "type": "mobile"
              }
          },
          "amount": null,
          "payee": null,
          "url": "https://verify.twilio.com/v2/Services/VAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Verifications/VEaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
      }
      ]
    ))

    actual = @client.verify.v2.services('VAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                              .verifications('sid').update(status: 'canceled')

    expect(actual).to_not eq(nil)
  end

  it "receives approve_verification_with_pn responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "sid": "VEaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "service_sid": "VAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "to": "+15017122661",
          "channel": "sms",
          "status": "approved",
          "valid": true,
          "date_created": "2015-07-30T20:00:00Z",
          "date_updated": "2015-07-30T20:00:00Z",
          "lookup": {
              "carrier": {
                  "error_code": null,
                  "name": "Carrier Name",
                  "mobile_country_code": "310",
                  "mobile_network_code": "150",
                  "type": "mobile"
              }
          },
          "amount": null,
          "payee": null,
          "url": "https://verify.twilio.com/v2/Services/VAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Verifications/VEaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
      }
      ]
    ))

    actual = @client.verify.v2.services('VAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                              .verifications('sid').update(status: 'canceled')

    expect(actual).to_not eq(nil)
  end

  it "can fetch" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.verify.v2.services('VAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                       .verifications('sid').fetch()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://verify.twilio.com/v2/Services/VAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Verifications/sid',
    ))).to eq(true)
  end

  it "receives fetch_verification responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "sid": "VEaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "service_sid": "VAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "to": "+15017122661",
          "channel": "sms",
          "status": "pending",
          "valid": false,
          "date_created": "2015-07-30T20:00:00Z",
          "date_updated": "2015-07-30T20:00:00Z",
          "lookup": {
              "carrier": {
                  "error_code": null,
                  "name": "Carrier Name",
                  "mobile_country_code": "310",
                  "mobile_network_code": "150",
                  "type": "mobile"
              }
          },
          "amount": null,
          "payee": null,
          "url": "https://verify.twilio.com/v2/Services/VAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Verifications/VEaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
      }
      ]
    ))

    actual = @client.verify.v2.services('VAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                              .verifications('sid').fetch()

    expect(actual).to_not eq(nil)
  end
end