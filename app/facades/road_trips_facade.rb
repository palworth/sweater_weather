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


private

  def directions_info
    @directions_info ||= GoogleService.new(@origin).travel_info(@destination)[:routes][0][:legs][0]
    require "pry"; binding.pry
  end

end
