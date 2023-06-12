class Api::V1::ForecastDataController < ApplicationController
  def index
    render json: ForecastDataSerializer.new(WeatherFacade.new(params[:location]).weather)
  end
end