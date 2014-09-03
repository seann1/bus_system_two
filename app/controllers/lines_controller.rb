class LinesController < ApplicationController

  def index
    @lines = Line.all
    @stations = Station.all
    @stops = Stop.all
    render 'index'
  end

  def new
    @line = Line.new
    render 'new'
  end

  def create
    @line = Line.create(line_params)
    if @line.valid?
      flash[:notice] = "This line has been added"
      redirect_to lines_path
    else
      render 'new'
    end
  end

  def show
    @line = Line.find(params[:id])
    render 'show'
  end

  def edit
    @line = Line.find(params[:id])
    render 'edit'
  end

  def update
    @line = Line.find(params[:id])
    if @line.update(line_params)
      flash[:notice] = "This line was successfully updated"
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    @line = Line.find(params[:id])
    @line.destroy
    flash[:notice] = "This line has been deleted"
    redirect_to root_path
  end

  private
    def line_params
      params.require(:line).permit(:name, line_ids: [])
    end

end
