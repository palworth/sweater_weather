require 'rails_helper'

describe "Forcast API" do
  it "sends weather data specific to denver", :vcr do

    location = "denver, co"

    get "/api/v1/antipode?location=#{location}"

    expect(response).to be_successful
#     {
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
end
