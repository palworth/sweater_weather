class Api::V1::BackgroundsController < ApplicationController
  def show
    background_service = UnsplashService.new
    service_response = background_service.find_picture(params[:location])
    render json: BackgroundSerializer.new(Background.new(service_response)) 
  end
end
