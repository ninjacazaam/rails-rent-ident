class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :show, :destroy, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save?
      redirect_to root
    else
      render :new
    end
  end

  def show
  end

  def update
    @user.update(user_params)
    redirect_to root
  end

  def edit; end

  def destroy
    @user.destroy
    redirect_to root
  end

  private

  def set_user
    @user = current_user
    authorize @user
  end

  def user_params
    params.require(:user).permit(:name, :email_address, :photo)
  end
end
