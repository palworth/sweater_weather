require 'rails_helper'

describe "Forcast API" do
  it "sends weather data specific to denver", vcr: {:record => :new_episodes} do

    location = "Hong Kong"

    get "/api/v1/antipode?location=#{location}"

    expect(response).to be_successful
    resp = JSON.parse(response.body, symbolize_names: true)[:data][:attributes]

    expect(resp[:forecast][0].keys).to eq([:id, :main, :description, :icon])
    expect(resp[:temperature]).to be_a Float
    expect(resp[:location_name]).to be_a String
    expect(resp[:search_location]).to be_a String
  end
end
