class RepliesController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def index


    render plain: "This number isn't read by anybody - so your message about '#{params[:Body]}' has gone into a black hole."
  end
end
