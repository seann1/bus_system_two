class StationsController < ApplicationController
  before_filter :authorize, only: [:edit, :update]

  def index
    @stations = Station.all
    @lines = Line.all
    @stops = Stop.all
    render 'index'
  end

  def new
    @station = Station.new
    render 'new'
  end

  def create
    @station = Station.create(station_params)
    if @station.valid?
      flash[:notice] = "This station has been added"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    @lines = Line.all
    @station = Station.find(params[:id])
    render 'show'
  end

  def edit
    @station = Station.find(params[:id])
    render 'edit'
  end

  def update
    @station = Station.find(params[:id])
    @lines = @station.lines
    @station.update(station_params)
      flash[:notice] = "This station has been updated"
      redirect_to root_path
  end

  def destroy
    @station = Station.find(params[:id])
    @station.destroy
    flash[:notice] = "This sation has been deleted"
    redirect_to root_path
  end

  private
    def station_params
      params.require(:station).permit(:name, line_ids: [])
    end

end
