class UsersController < ApplicationController

  # For testing purposes only
  def index
    @users = User.all
  end

  def new
    # for error handling
    @user = User.new
  end

  def create
    @user = User.create()
    @user.username = params[:username]
    @user.name = params[:name]
    @user.email = params[:email]
    @user.bio = params[:bio]
    @user.img = params[:img]
    @user.save
    redirect_to('/')
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def update
  end

  def delete
    @user = User.find(params[:id])
    @user.destroy
    redirect_to('/')
  end

end