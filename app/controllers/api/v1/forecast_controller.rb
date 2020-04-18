class Api::V1::ForecastController < ApplicationController
  def show
    location =  params[:location]
    service = GoogleService.new
    location_lat_lng = service.get_lat_lng(location)
    
  end

end
