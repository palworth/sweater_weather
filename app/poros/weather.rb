class Weather
  attr_reader :current, :hourly, :daily_forecast, :id
  def initialize(weather_service_response)
    @id = nil
    @current = weather_service_response[:current]
    @hourly = weather_service_response[:hourly]
    @daily_forecast = weather_service_response[:daily]
  end

  def current_humidity
    @current[:humidity]
  end

  def current_visibility
    @current[:visibility]
  end

  def current_feels_like
    @current[:feels_like]
  end

  def current_uvi
    @current[:uvi]
  end



end
