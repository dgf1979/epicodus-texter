require 'rails_helper'

describe Message, :vcr => true do
  it "should not save if twilio errors" do
    message = Message.new(:body => 'test', :to => '123456', :from => '2315771805')
    expect(message.save).to eql(false)
  end

  it "should have an error message if the number is invalid" do
    message = Message.new(:body => 'test', :to => '123456', :from => '2315771805')
    message.save
    message.errors[:base].should eq ["The 'To' number 123456 is not a valid phone number."]
  end
end
