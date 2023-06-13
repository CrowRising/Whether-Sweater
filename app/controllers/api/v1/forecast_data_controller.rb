# frozen_string_literal: true

module Api
  module V1
    class ForecastDataController < ApplicationController
      def index
        render json: ForecastDataSerializer.new(WeatherFacade.new(params[:location]).weather)
      end
    end
  end
end
