class Api::V1::AntipodesController < ApplicationController
  def show
    antipode_results = AntipodeFacade.new(params[:location]).show_helper
    render json: AntipodeForecastSerializer.new(antipode_results)
  end
end
