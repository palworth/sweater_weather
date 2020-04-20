class Api::V1::AntipodesController < ApplicationController
  def show
    location_service = GoogleService.new
    location_data = location_service.location_info(params[:location])
  end
end
