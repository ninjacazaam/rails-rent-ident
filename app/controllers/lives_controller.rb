class LivesController < ApplicationController
  before_action :set_life, only: [:show, :edit, :update, :destroy]

  def index
    @lives = policy_scope(Life)
  end

  def show
  end

  def new
    @life = Life.new
    authorize @life
  end

  def create
    @life = Life.new(life_params)
    @life.user = current_user
    authorize @life

    if @life.save
      redirect_to life_path(@life)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @life.update(params[:life])
    redirect_to life_path(@life)
  end

  def destroy
    @life.destroy
    redirect_to lives_path
  end

  private

  def set_life
    @life = Life.find(params[:id])
    authorize @life
  end

  def life_params
    params.require(:life).permit(:title, :bio, :price)
  end
end
