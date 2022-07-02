class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :show, :destroy, :update]

  def new
    @user = User.new

    skip_authorization
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
    @upcoming_bookings = Booking.where(user_id: current_user.id)
    @my_bookings = []
    current_user.lives.each do |life|
      @my_bookings << Booking.where(life_id: life.id)
    end

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
    params.require(:user).permit(:name, :email_address, :avatar)
  end
end
