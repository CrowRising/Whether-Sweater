# frozen_string_literal: true

class ForecastDataSerializer
  include JSONAPI::Serializer
  attributes :current_weather, :daily_weather, :hourly_weather
end
