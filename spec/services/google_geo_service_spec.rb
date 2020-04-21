require 'rails_helper'

RSpec.describe GoogleGeoApiService do
  describe 'instance methods' do
    describe '#location_info' do
      it "returns the location data of a given city and state", :vcr => { :re_record_interval => 7.days } do
        location = "denver,co"
        service = GoogleGeoApiService.new(location)
        location_info = service.location_info(location)

        expect(location_info).to be_a Hash
        expect(location_info[:address_components].first).to have_key(:long_name)
        expect(location_info[:address_components].first[:long_name]).to eq("Denver")

        expect(location_info[:address_components][3]).to have_key(:long_name)
        expect(location_info[:address_components][3][:long_name]).to eq("United States")

        expect(location_info[:geometry][:location][:lat]).to eq(39.7392358)
        expect(location_info[:geometry][:location][:lng]).to eq(-104.990251)
      end

      it "returns nil if location not found", :vcr => { :re_record_interval => 7.days } do
        location = "notaplace"
        service = GoogleGeoApiService.new(location)
        location_info = service.location_info(location)
        expect(location_info).to be_nil        # expect(location_info[:status]).to eq("ZERO_RESULTS")
      end
    end

    describe "travel_data" do
      it "returns the travel data for a given origin and destination", :vcr do
        start = "denver,co"
        destination = "pueblo,co"

        service = GoogleGeoApiService.new(start)
        travel_data = service.travel_directions(destination)

        expect(travel_data).to be_a Hash
      end
    end
  end
end
