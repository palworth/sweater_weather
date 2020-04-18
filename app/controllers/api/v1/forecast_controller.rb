class Api::V1::ForecastController < ApplicationController
  def show
      #all this needs to go into the forcast poro
    location_service = GoogleService.new
    location_data = location_service.location_info( params[:location])
    forecast = Forecast.new
    forecast.by_location(location_data[:geometry][:location])

    render json: ForecastSerializer.new(forecast)
  end

end
