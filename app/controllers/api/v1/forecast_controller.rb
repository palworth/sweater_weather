class Api::V1::ForecastController < ApplicationController
  def show
    location_service = GoogleService.new
    location_data = location_service.location_info(params[:location])
    forecast = ForecastFacade.new
    forecast_data = forecast.by_location(location_data) #weather object
    render json: ForecastSerializer.new(forecast_data)
  end

end
