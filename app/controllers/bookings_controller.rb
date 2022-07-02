class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]
  before_action :set_life, only: [:new]

  def index
    @bookings = Booking.all
  end

  def show
  end

  def new
    @booking = Booking.new
    authorize @booking
    @booking.life_id = @life.id
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.status = "pending"
    if @booking.save
      redirect_to life_path(params["booking"]["life_id"])
      authorize @booking
    else
      render :new
    end
  end

  def edit
  end

  def update
    @booking.update(params[:booking])
    redirect_to booking_path(@booking)
  end

  def destroy
    @booking.destroy
    redirect_to bookings_path
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def set_life
    @life = Life.find(params[:life_id])
    authorize @life
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :life_id, :user_id)
  end

end
