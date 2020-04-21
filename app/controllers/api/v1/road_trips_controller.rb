class Api::V1::RoadTripsController < ApplicationController
  def create
    user = User.find_by(api_key: params[:api_key])
    if !user.nil?
      success
    else
      failed
    end
  end

  private
  def success
    facade = RoadTripsFacade.new(params[:origin], params[:destination])

    road_trip_info = facade.details # need to return road_trip
    render json: RoadtripSerializer.new(road_trip_info)
  end

  def failed
    render json: { failed: 'Unauthorized, check API credentials' }, status: 401
  end
end
