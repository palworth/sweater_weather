class RoadTrip
  attr_reader :origin, :destination, :travel_time, :arrival_forecast, :id

  def initialize(origin, destination)
    @id = nil
    @origin = origin
    @destination = destination
    @travel_time = travel_time
    @arrival_forecast = arrival_forecast
  end

  def travel_time
    directions_info[:duration][:text]
  end

  def arrival_forecast
    x = forecast_info
    {weather_description: "#{x.description}", temperature: x.temp}
  end

  private
  def directions_info
   @directions_info ||= GoogleGeoApiService.new(@origin).travel_directions(@destination)[:routes][0][:legs][0]
  end

  def forecast_info
    service = OpenWeatherService.new(destination_data).weather_info
    x = WeatherForecast.new(service)
  end

  def destination_data
    location_service = GoogleService.new
    location_data = location_service.location_info(@destination)
    Location.new(location_data)
  end


end
