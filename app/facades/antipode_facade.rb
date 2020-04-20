class AntipodeFacade < ForecastFacade
  def initialize(location)
    @location = location
  end

  def show_helper
    location_service = GoogleService.new

    location_data = location_service.location_info(@location)
    start_city_lat = location_data[:geometry][:location][:lat]
    start_city_lng = location_data[:geometry][:location][:lng]

    antipode_service = AntipodeService.new
    antipode_response_coords = antipode_service.opposite_city(start_city_lat, start_city_lng)
    name_of_antipode_city = location_service.city_name(antipode_response_coords[:lat], antipode_response_coords[:long])
    by_antipode_location(antipode_response_coords) #Antipode forcast data
  end

  def by_antipode_location(location_info) #returns stored weather object or creates one to return
    antipode_coords = create_or_find_antipode_location(location_info)
    service = OpenWeatherService.new(@location_data)
    @weather_data ||= AntipodeWeather.new(service.weather_info, location_info, @location) #this gets serialized
  end

  def create_or_find_antipode_location(location_info)
    @location_data ||= AntipodeLocation.new(location_info)
  end
end
