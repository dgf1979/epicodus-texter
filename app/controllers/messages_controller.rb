class MessagesController < ApplicationController
  def index
    @messages = Message.all
  end
  def new
    @message = Message.new
    @contacts = Contact.where.not(name: "Twilio")
  end

  def create
    @contacts = Contact.where.not(name: "Twilio")
    contact_array = []
    message_params[:to].each do |number|
      contact = Contact.where(phone_number: number)[0]
      @message = Message.new(to: number, from: message_params[:from], body: message_params[:body])
      if SMS.send(@message)
        if @message.save
          contact_array.push(contact.name)
        end
      end
    end

    flash[:notice] = "Sent to: #{contact_array.join(', ')}"


    redirect_to new_message_path
  end




  def show
    @message = Message.find(params[:id])
  end

private
  def message_params
    params.require(:message).permit(:from, :body, :to => []).merge(:from => ENV['FROM_NUMBER'])
  end
end
