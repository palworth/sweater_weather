require 'rails_helper'

describe "Forcast API" do
  it "sends weather data specific to denver" do

    location = "denver,co"

    get "/api/v1/forecast?location=#{location}"

    expect(response).to be_successful
  end
end
