class FightersController < ApplicationController
  before_action :set_fighter, only: [:show, :edit, :update, :destroy]
  def index
    @fighters = Fighter.all
    if params[:query].present?
      @fighters = Fighter.where(name: params[:query])
    else
      @fighters = Fighter.all
    end
  end

  def show
  end

  def new
    @fighter = Fighter.new
  end

  def create
    @fighter = Fighter.new(fighter_params)
    if @fighter.save
      redirect_to fighter_path(@fighter)
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @fighter.update(fighter_params)
  end

  def destroy
    @fighter.destroy
    redirect_to fighters_path, status: :see_other
  end

  private

  def set_fighter
    @fighter = Fighter.find(params[:id])
  end

  def fighter_params
    params.require(:fighter).permit(:name, :side, :photo)
  end
end
