require 'rails_helper'

describe 'I can create a road trip' do

    it 'can take in road trip info and return travel time and arrival forecast', vcr: {:record => :new_episodes} do
      user = User.create!({
                            email: "test@email.com",
                            password: "password",
                            password_confirmation: "password"
                          })

      post "/api/v1/road_trip", params: {
                                        origin: "Denver,CO",
                                        destination: "Fort Collins,CO",
                                        api_key: user.api_key, }.to_json,
                                headers: {
                                          'Content-Type' => 'application/json',
                                          'Accept' => 'application/json'
                                          }

    expect(response).to be_successful
    road_trip = JSON.parse(response.body, symbolize_names: true)[:data][:attributes]
    expect(road_trip[:origin]).to eq('Denver,CO')
    expect(road_trip[:travel_time]).to eq('1 hour 10 mins')
    expect(road_trip[:destination]).to eq('Fort Collins,CO')
    expect(road_trip[:arrival_forecast][:temperature]).to be_a Float
    expect(road_trip[:arrival_forecast][:weather_description]).to be_a String
  end
    it 'Will fail with bad API key', vcr: {:record => :new_episodes} do

    post "/api/v1/road_trip", params: {
                                    origin: "Denver,CO",
                                    destination: "Fort Collins,CO"}.to_json,
                            headers: {
                                      'Content-Type' => 'application/json',
                                      'Accept' => 'application/json'
                                        }

    expect(response).to_not be_successful
    road_trip = JSON.parse(response.body, symbolize_names: true)
    expect(road_trip[:failed]).to eq('Unauthorized, check API credentials')
    end
end
