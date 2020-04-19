require 'rails_helper'

describe "Background API" do
  it "sends a picture for background specific to denver",:vcr do

    location = "denver"

    get "/api/v1/background?location=#{location}"

    expect(response).to be_successful

  end
end
