require 'rails_helper'

describe 'I can create a road trip' do

    it 'can take in road trip info and return travel time and arrival forecast', :vcr do
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
  end
end
