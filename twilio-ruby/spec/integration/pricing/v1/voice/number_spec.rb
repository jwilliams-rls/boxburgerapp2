##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /       

require 'spec_helper.rb'

describe 'Number' do
  it "can fetch" do
    @holodeck.mock(Twilio::TwilioResponse.new(500, ''))
    
    expect {
      @client.pricing.v1.voice \
                        .numbers("+987654321").fetch()
    }.to raise_exception(Twilio::REST::TwilioException)
    
    values = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://pricing.twilio.com/v1/Voice/Numbers/+987654321',
    ))).to eq(true)
  end

  it "receives fetch responses" do
    @holodeck.mock(Twilio::TwilioResponse.new(
        200,
      %q[
      {
          "country": "United States",
          "inbound_call_price": {
              "base_price": null,
              "current_price": null,
              "number_type": null
          },
          "iso_country": "US",
          "number": "+987654321",
          "outbound_call_price": {
              "base_price": "0.015",
              "current_price": "0.015"
          },
          "price_unit": "USD",
          "url": "https://pricing.twilio.com/v1/Voice/Numbers/+987654321"
      }
      ]
    ))
    
    actual = @client.pricing.v1.voice \
                               .numbers("+987654321").fetch()
    
    expect(actual).to_not eq(nil)
  end
end