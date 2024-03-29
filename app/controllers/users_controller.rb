class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    @establishments = @user.establishments
    @title = @user.name
  end
  
  def new
    @user = User.new
    @title = "Sign up"
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:success] = "It is time to party! You are all signed up."
      redirect_to @user
    else
      @title = "Sign up"
      render 'new'
    end
  end
end
