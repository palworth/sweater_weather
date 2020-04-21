class ForecastFacade
  attr_reader :id
  def initialize
    @location_data = nil
    @weather_data = nil
    @id = nil
  end

  def create_or_find_location(location_info)
    @location_data ||= Location.new(location_info)
  end

  def by_location(location_info) #returns stored weather object or creates one to return
    create_or_find_location(location_info)
    service = OpenWeatherService.new(@location_data)
    @weather_data ||= Weather.new(service.weather_info) #this gets serialized
  end

end
