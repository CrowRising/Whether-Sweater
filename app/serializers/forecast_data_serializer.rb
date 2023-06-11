class ForecastDataSerializer
  include JSONAPI::ForecastDataSerializer
  attributes :current_weather, :daily_weather, :hourly_weather
end