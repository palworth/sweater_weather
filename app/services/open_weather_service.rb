class OpenWeatherService
  def initialize(location_data)
    @lat_data = location_data[:lat]
    @lng_data = location_data[:lng]
  end

  def weather_info
    response = conn.get("/data/2.5/onecall?") do |f|
      f.params['appid']= ENV['OpenWeatherKey']
      f.params["lat"]= @lat_data
      f.params["lon"]= @lng_data
    end
    json = JSON.parse(response.body, symbolize_names: true)

  end

  private
  def conn
    Faraday.new("https://api.openweathermap.org")
  end
end
