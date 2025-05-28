class HomeController < ApplicationController
  # redirect_to start_path if user_signed_in?
  def index
    render({ :template => "home/index" })
  end
end
