class AntipodeWeather
  attr_reader :forecast, :location_name, :search_location, :id
  def initialize(weather_service_response,location_coords, search_params)
    @id = nil
    @forecast = weather_service_response[:daily][:data]
    @location_name = antipode_city_name(location_coords)
    @search_location = "#{search_params}"
  end

  def antipode_city_name(location_coords)
    service = GoogleService.new
    service.city_name(location_coords[:lat], location_coords[:long])
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
