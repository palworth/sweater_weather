class AntipodeWeather
  attr_reader :forecast, :location_name, :search_location, :id, :temperature
  def initialize(weather_service_response,location_coords, search_params)
    @id = nil
    @temperature = weather_service_response[:current][:temp]
    @forecast = weather_service_response[:daily][0][:weather]
    @location_name = antipode_city_name(location_coords)
    @search_location = "#{search_params}"
  end

  def antipode_city_name(location_coords)
    service = GoogleService.new
    service.city_name(location_coords[:lat], location_coords[:long])
  end

end
