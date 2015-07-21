class RepliesController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def default
    render plain: "This number isn't read by anybody - so your message about '#{params[:Body]}' has gone into a black hole."
    Message.create(body: params[:Body], to: ENV['FROM_NUMBER'], from: params[:From])
  end
end
