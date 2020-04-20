class Api::V1::AntipodesController < ApplicationController
  def show
    location_service = GoogleService.new
    location_data = location_service.location_info(params[:location])
    start_city_lat = location_data[:geometry][:location][:lat]
    start_city_lng = location_data[:geometry][:location][:lng]

    antipode_service = AntipodeService.new
    antipode_response_coords = antipode_service.opposite_city(start_city_lat, start_city_lng)

    # antipode_city_forecast = location
    # forecast = Forecast.new
    # forecast_data = forecast.by_location(location_data) #weather object
    #
    #
    #

    # render json: ForecastSerializer.new(forecast_data)
end
