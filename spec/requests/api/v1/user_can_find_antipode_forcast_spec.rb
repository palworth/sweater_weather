require 'rails_helper'

describe "Forcast API" do
  it "sends weather data specific to denver" do

    location = "Hong Kong"

    get "/api/v1/antipode?location=#{location}"

    expect(response).to be_successful

  end
end
