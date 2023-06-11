require 'rails_helper'

RSpec.describe 'ForecastData', type: :request do
  describe 'Forecast for specific location' do
    it 'can return forecast data for specific location', :vcr do
      get '/api/v1/forecast?location=denver,co'

      expect(response).to have_http_status :success

      weather_stats = JSON.parse(response.body, symbolize_names: true)

      expect(weather_stats).to be_a Hash
      expect(weather_stats).to have_key :data
      expect(weather_stats[:data]).to be_a Hash
      expect(weather_stats[:data]).to have_key :id
      expect(weather_stats[:data][:id]).to eq(nil)
      expect(weather_stats[:data]).to have_key :type
      expect(weather_stats[:data][:type]).to eq('forecast_data')
      expect(weather_stats[:data]).to have_key :attributes
      expect(weather_stats[:data][:attributes]).to be_a Hash
      expect(weather_stats[:data][:attributes]).to have_key :current_weather
      expect(weather_stats[:data][:attributes]).to have_key :hourly_weather
      expect(weather_stats[:data][:attributes]).to have_key :daily_weather



    end
  end
end