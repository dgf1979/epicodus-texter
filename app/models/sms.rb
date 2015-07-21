class SMS
  @@errors = []

  def self.errors
    return @@errors
  end

  def self.send(message)
    @@errors = []
    begin
     request = RestClient::Request.new(
        :method => :post,
        :url => "https://api.twilio.com/2010-04-01/Accounts/#{ENV['TWILIO_ACCOUNT_SID']}/Messages.json",
        :user => ENV['TWILIO_ACCOUNT_SID'],
        :password => ENV['TWILIO_AUTH_TOKEN'],
        :payload => { :Body => message.body,
                      :To => message.to,
                      :From => message.from }
      )
      response = request.execute
    rescue RestClient::BadRequest => e
      error_message = JSON.parse(e.response)['message']
      @@errors.push(error_message)
      return false
    rescue Exception => e
      error_message = e
      @@errors.push(error_message)
      return false
    end
    return true
  end

end
