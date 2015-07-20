class Message < ActiveRecord::Base
  before_create :send_sms
  validates :to, presence: true
  validates :from, presence: true
  validates :body, presence: true

private
  def send_sms
    begin
     request = RestClient::Request.new(
        :method => :post,
        :url => "https://api.twilio.com/2010-04-01/Accounts/#{ENV['TWILIO_ACCOUNT_SID']}/Messages.json",
        :user => ENV['TWILIO_ACCOUNT_SID'],
        :password => ENV['TWILIO_AUTH_TOKEN'],
        :payload => { :Body => body,
                      :To => to,
                      :From => from }
      )
      response = request.execute
    rescue RestClient::BadRequest => e
      error_message = JSON.parse(e.response)['message']
      errors.add(:base, error_message)
      false
    end

  end
end
