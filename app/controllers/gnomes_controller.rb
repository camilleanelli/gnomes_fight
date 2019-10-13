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
    @gnome = Gnome.find(params[:id])
    if @gnome.destroy
      redirect_to gnomes_path
    else
      render :show
    end
  end

  private

  def gnomes_params
    params.require(:gnome).permit(:name, :country)
  end

end
