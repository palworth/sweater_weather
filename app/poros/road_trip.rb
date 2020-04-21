class RoadTrip
  attr_reader :origin, :destination, :travel_time, :arrival_forecast, :id

  def initialize(origin, destination)
    @id = nil
    @origin = origin
    @destination = destination
    @travel_time = travel_time
    @arrival_forecast = arrival_forecast
  end

  def travel_time
    directions_info[:duration][:text]
  end

  private
  def directions_info
   @directions_info ||= GoogleGeoApiService.new(@origin).travel_directions(@destination)[:routes][0][:legs][0]
  end

end
