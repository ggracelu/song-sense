# app/controllers/users_controller.rb
class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  def new
    @user = User.new
    render({ :template => "users/new" })
  end

  def create
    @user = User.new
    @user.email = params.fetch("email")
    @user.password = params.fetch("password")

    if @user.save
      session[:user_id] = @user.id
      redirect_to("/profile", { :notice => "Welcome!" })
    else
      render({ :template => "users/new" })
    end
  end
  
  def show
    @playlists = @user.playlists
    @likes = @user.likes
  end

  def destroy
    @user.destroy
    redirect_to root_path, notice: "Your account has been deleted."
  end

  private

  def set_user
    @user = current_user
  end
end
