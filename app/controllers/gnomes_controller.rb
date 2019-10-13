class GnomesController < ApplicationController
  def index
    @gnomes = Gnome.all.order(:name)
  end

  def show
    @gnome = Gnome.find(params[:id])
  end

  def edit
    @gnome = Gnome.find(params[:id])
  end

  def update
    @gnome = Gnome.find(params[:id])
    if @gnome.update(gnomes_params)
      redirect_to gnomes_path
    else
      render "edit"
    end
  end

  def new
  end

  def create
  end

  def destroy
  end

  private

  def gnomes_params
    params.require(:gnome).permit(:name, :country)
  end

end
