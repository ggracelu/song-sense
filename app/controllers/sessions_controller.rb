class SessionsController < ApplicationController
  def new
    render({ :template => "sessions/new" })
  end

  def create
    user = User.find_by({ :email => params.fetch("email") })

    if user && user.authenticate(params.fetch("password"))
      session[:user_id] = user.id
      redirect_to("/profile", { :notice => "Welcome back!" })
    else
      flash.now[:alert] = "Invalid email or password."
      render({ :template => "sessions/new" })
    end
  end

  def destroy
    reset_session
    redirect_to("/", { :notice => "Logged out!" })
  end
end
