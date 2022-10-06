class UsersController < ApplicationController
  before_action :set_user, only: [:destroy, :edit, :show, :update]

  def show
    @articles = @user.articles
  end

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user, notice: "Welcome #{@user.username}, you have successfully signed up"
    else
      render "new", status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: "Your account was updated successfully"
    else
      render "edit", status: :unprocessable_entity
    end
  end
end

private

def set_user
  @user = User.find(params[:id])
end

def user_params
  params.require(:user).permit(:username, :email, :password)
end
