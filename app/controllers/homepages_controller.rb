class HomepagesController < ApplicationController

  def index
    @lines = Line.all
    @stations = Station.all
    @stops = Stop.all
    render('/index.html.erb')
  end

end
