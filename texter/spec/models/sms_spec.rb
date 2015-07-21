require 'rails_helper'

describe Message, :vcr => true do

  it "should have an error message if the number is invalid" do
    message = Message.new(:body => 'test', :to => '123abcd1234', :from => '2315771805')
    SMS.send(message)
    SMS.errors.should eq ["The 'To' number 123456 is not a valid phone number."]
  end

  it "should not save if a phone number is not 9 digits" do
    message = Message.new(:body => 'test', :to => '123456', :from => '2315771805')
    expect(SMS.send(message)).to eql(false)
  end

end
