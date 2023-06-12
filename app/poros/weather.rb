# frozen_string_literal: true

class Weather
  attr_reader :id,
              :current_weather,
              :daily_weather,
              :hourly_weather,
              :books

  def initialize(data)
    @id = nil
    @current_weather = data[:current_weather]
    @daily_weather = data[:daily_weather]
    @hourly_weather = data[:hourly_weather]
    @books = data[:books]
  end
end
