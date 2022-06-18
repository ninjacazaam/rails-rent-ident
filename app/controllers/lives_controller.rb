class LivesController < ApplicationController

  def index
    @lives = Life.all
  end

  def show
    @life = Life.find(params[:id])
  end

  def new
    @life = Life.new
  end

  def create
    @life = Life.new(life_params)
    if @life.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  def edit
    @life = Life.find(params[:id])
  end

  def update
    @life = Life.find(params[:id])
    @life.update(params[:life])
    redirect_to life_path(@life)
  end

  def destroy
    @life = Life.find(params[:id])
    @life.destroy
    redirect_to lives_path
  end

  private

  def life_params
    params.require(:life).permit(:title, :bio, :price)
  end
end
