class Message < ActiveRecord::Base
  before_create :send_sms

private
  def send_sms
   request = RestClient::Request.new(
      :method => :post,
      :url => 'https://api.twilio.com/2010-04-01/Accounts/AC12e6b7b59a4d1103d157293cc4066466/Messages.json',
      :user => 'AC12e6b7b59a4d1103d157293cc4066466',
      :password => 'b66ed16455c1fb7dd67af655933d9b19',
      :payload => { :Body => body,
                    :To => to,
                    :From => from }
    )
    response = request.execute

  end
end
