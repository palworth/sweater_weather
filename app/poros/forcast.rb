class Forcast
  def initialize
    @location_data = nil
    @weather_data = nil
  end

  def create_or_find_location(location_info)
    @location_data ||= Location.new()
  end

  def by_location(location_info)
    create_or_find_location(location_info)
    service = OpenWeatherService.new(@location_data)
    service.weather_info
    @weather_data ||= Weather.new()
  end
end
