require 'rails_helper'

describe "Forcast API" do
  it "sends weather data specific to denver", vcr: {:record => :new_episodes} do

    location = "denver, co"

    get "/api/v1/forecast?location=#{location}"

    expect(response).to be_successful

    resp = JSON.parse(response.body, symbolize_names: true)[:data][:attributes]

    expect(resp[:daily_forecast][0].keys).to eq([:time, :forecast_summary, :temperature_high, :temperature_low, :rain_in_mm, :icon])
    expect(resp[:current_feels_like]).to be_a Float
    expect(resp[:current_uvi]).to be_a Float
    expect(resp[:daily_forecast]).to be_a Array

  end
end
