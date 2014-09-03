class StopsController < ApplicationController

  def index
    @stops = Stop.all
    render 'index'
  end

  def new
    @stop = Stop.new
    render 'new'
  end

  def create
    @stop = Stop.create(params[:stop])
    if @stop.valid?
      flash[:notice] = "This stop has been added"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    @stop = Stop.find(params[:id])
    render 'show'
  end

  def edit
    @stop = Stop.find(params[:id])
    render 'edit'
  end

  def update
    @stop = Stop.create(params[:id])
    if @stop.update(params[:stop])
      flash[:notice] = "This stop was successfully updated"
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    @stop = Stop.find(params[:id])
    @stop.destroy
    flash[:notice] = "This stop has been deleted"
    redirect_to root_path
  end
end
