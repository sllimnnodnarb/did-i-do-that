class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def confirm
    @user = User.new
    @user.email = params[:user][:email]
  end

  def create
    @user = User.new
    @user.email = params[:user][:email]
    @user.password = params[:user][:password]
    @user.password_confirmation = params[:user][:password_confirmation]

    if @user.save
      flash[:notice] = "Welcome #{@user.email}, go make a list!"
      create_session(@user)
      redirect_to root_path
    else
      flash.now[:alert] = "There was an error creating your account. Please try again."
      render :new
    end
  end

  def show
    @users = User.all
    @items = current_user.items.uncompleted
    @completed_items = current_user.items.completed
  end
end
