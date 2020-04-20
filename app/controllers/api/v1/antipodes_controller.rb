class Api::V1::AntipodesController < ApplicationController
  def show
    facade_response = AntipodeFacade.new
    render json: AntipodeForecastSerializer.new(facade_response.show_helper(params[:location]))
  end
end
