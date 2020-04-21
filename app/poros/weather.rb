class Weather
  attr_reader :current, :hourly, :daily_forecast, :city_state, :id
  def initialize(weather_service_response)
    @id = nil
    @info = weather_service_response
    @current = weather_service_response[:current]
    @daily_forecast = organize_week(weather_service_response[:daily][0..7])
    @hourly = organize_day(weather_service_response[:hourly][0..6])
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

  def city_state
    x = GoogleService.new.city_name(@info[:lat], @info[:lon])
  end
  
  private
  def organize_day(hourly_forecast)
    hourly_forecast.map do |forecast|
      {time: format_time(forecast[:dt]),
        temperature: forecast[:temp],
        icon: "http://openweathermap.org/img/wn/" + forecast[:weather].first[:icon] + "@2x.png"}
    end
  end

  def organize_week(daily_forecast)
    daily_forecast.map do |forecast|
      {time: format_day(forecast[:dt]),
        forecast_summary: forecast[:weather].first[:main],
        temperature_high: forecast[:temp][:max],
        temperature_low: forecast[:temp][:min],
        rain_in_mm: forecast[:rain],
        icon: "http://openweathermap.org/img/wn/" + forecast[:weather].first[:icon] + "@2x.png"}
    end
  end

  def format_day(time)
    Time.at(time).strftime('%A')
  end

  def format_time(time)
    Time.at(time).strftime("%-I %p")
  end

end
