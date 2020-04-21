class RoadTripsFacade
  def initialize(origin, destination)
    @id = nil
    @origin = origin
    @destination = destination
    @location_data = nil
  end

  def details
    trip = RoadTrip.new(@origin, @destination)
  end
end
