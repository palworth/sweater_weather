class Location
  attr_reader :city, :state, :latitude, :longitude
  def initialize(data)
    @city = data[:address_components][0][:long_name]
    @state = data[:address_components][2][:long_name]
    @latitude = data[:geometry][:location][:lat]
    @longitude = data[:geometry][:location][:lng]
  end
end
