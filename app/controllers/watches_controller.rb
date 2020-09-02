class WatchesController < ApplicationController

  def index
    @watches = Watch.all
  end

  def show
    @watch = Watch.find(params[:id])
  end

  def new
    @watch = Watch.new
  end

  def create
    @watch = Watch.new(watch_params)
		@watch.user = current_user
		
    if @watch.save
      redirect_to watches_path
    else
      render :new
    end
  end

  private

  def watch_params
    params.require(:watch).permit(:brand, :reference_number, :model_year, :price, :condition, :photo)
  end
end
