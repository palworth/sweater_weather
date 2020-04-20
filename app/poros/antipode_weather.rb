class AntipodeWeather
  attr_reader :current, :hourly, :daily_forecast, :id
  def initialize(weather_service_response,location_coords)
    @id = nil
    @current = weather_service_response[:current]
    @location_name = antipode_city_name
    @forecast = weather_service_response[:daily]
  end

  def current_humidity
    @current[:humidity]
  end

  def current_visibility
    @current[:visibility]
  end

  def antipode_city_name
    require "pry"; binding.pry
  end

#   {
#     "data": {
#         "id": "null",
#         "type": "antipode",
#         "attributes": {
#             "location_name": "Antipode City Name",
#             "forecast": {
#                 "summary": "Mostly Cloudy,
#                 "current_temperature": "72",
#             },
#             "search_location": "Hong Kong"
#         }
#     }
# }

end
