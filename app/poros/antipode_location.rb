class AntipodeLocation
  attr_reader :latitude, :longitude
  def initialize(data)
    @latitude = data[:lat]
    @longitude = data[:long]
  end
end
