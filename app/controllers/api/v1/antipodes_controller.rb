class Api::V1::AntipodesController < ApplicationController
  def show
    location_service = GoogleService.new

    location_data = location_service.location_info(params[:location])
    start_city_lat = location_data[:geometry][:location][:lat]
    start_city_lng = location_data[:geometry][:location][:lng]

    antipode_service = AntipodeService.new
    antipode_response_coords = antipode_service.opposite_city(start_city_lat, start_city_lng)
    name_of_antipode_city = location_service.city_name(antipode_response_coords[:lat], antipode_response_coords[:long])

    #SERIALIZE CORRECT RESPONSE
    forecast = Forecast.new
    antipode_forecast_data = forecast.by_antipode_location(antipode_response_coords, params[:location]) #Antipode forcast data
    render json: AntipodeForecastSerializer.new(antipode_forecast_data)
  end
end
