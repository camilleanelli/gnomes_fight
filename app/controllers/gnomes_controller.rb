class GnomesController < ApplicationController
  before_action :find_gnome, only: [:show, :edit, :update, :destroy]

  def index
    @gnomes = Gnome.all.order(:name)
  end

  def show
  end

  def edit
  end

  def update
    if @gnome.update(gnomes_params)
      redirect_to gnomes_path
    else
      render "edit"
    end
  end

  def new
    @gnome = Gnome.new
  end

  def create
    @gnome = Gnome.new(gnomes_params)
    if @gnome.save
      redirect_to gnomes_path
    else
      render "new"
    end
  end

  def destroy
    if @gnome.destroy
      redirect_to gnomes_path
    else
      render :show
    end
  end

  private

  def find_gnome
    @gnome = Gnome.find(params[:id])
  end

  def gnomes_params
    params.require(:gnome).permit(:name, :country)
  end

end
