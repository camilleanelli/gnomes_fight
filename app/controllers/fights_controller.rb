class FightsController < ApplicationController

  def index
    @fights = Fight.all.includes(:rounds)
  end

  def new
    @fight = Fight.new
  end

  def create
    @fight = Fight.new(params_fights)
    if @fight.save
      @fight.find_winner_gnome
      redirect_to @fight
    else
      render :new
    end
  end

  def show
    @fight = Fight.find(params[:id])
    @rounds = @fight.rounds
    @gnome1 = @fight.gnome1
    @gnome2 = @fight.gnome2
  end

  private

  def params_fights
    params.fetch(:fight).permit(:gnome1_id, :gnome2_id, :weapon_one_id, :weapon_two_id)
  end
end
