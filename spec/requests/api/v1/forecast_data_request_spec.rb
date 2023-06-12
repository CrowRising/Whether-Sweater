require 'rails_helper'

RSpec.describe 'ForecastData', type: :request do
  describe 'Forecast for specific location' do
    it 'can return forecast data for specific location', :vcr do
      get '/api/v1/forecast?location=denver,co'

      expect(response).to have_http_status :success
      expect(response.status).to eq(200)

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

      expect(weather_stats[:data][:attributes]).to_not have_key :country
      expect(weather_stats[:data][:attributes]).to_not have_key :temp_c
      expect(weather_stats[:data][:attributes]).to_not have_key :wind_mph
      expect(weather_stats[:data][:attributes]).to_not have_key :feelslike_c

      current_forecast = weather_stats[:data][:attributes][:current_weather]

      expect(current_forecast).to be_a Hash
      expect(current_forecast).to have_key :last_updated
      expect(current_forecast[:last_updated]).to be_a String
      expect(current_forecast).to have_key :temp_f
      expect(current_forecast[:temp_f]).to be_a Float
      expect(current_forecast).to have_key :condition
      expect(current_forecast[:condition]).to be_a String
      expect(current_forecast).to have_key :icon
      expect(current_forecast[:icon]).to be_a String
      expect(current_forecast).to have_key :humidity
      expect(current_forecast[:humidity]).to be_an Integer
      expect(current_forecast).to have_key :feelslike_f
      expect(current_forecast[:feelslike_f]).to be_an Float
      expect(current_forecast).to have_key :vis_miles
      expect(current_forecast[:vis_miles]).to be_an Float
      expect(current_forecast).to have_key :uvi
      expect(current_forecast[:uvi]).to be_an Float

      expect(weather_stats[:data][:attributes][:daily_weather]).to be_an Array

      weather_stats[:data][:attributes][:daily_weather].each do |daily|
        expect(daily).to be_a Hash
        expect(daily).to have_key :date
        expect(daily[:date]).to be_a String
        expect(daily).to have_key :sunrise
        expect(daily[:sunrise]).to be_a String
        expect(daily).to have_key :sunset
        expect(daily[:sunset]).to be_a String
        expect(daily).to have_key :max_temp
        expect(daily[:max_temp]).to be_a Float
        expect(daily).to have_key :min_temp
        expect(daily[:min_temp]).to be_a Float
        expect(daily).to have_key :condition
        expect(daily[:condition]).to be_a String
        expect(daily).to have_key :icon
        expect(daily[:icon]).to be_a String

        expect(weather_stats[:data][:attributes][:hourly_weather]).to be_an Array

        weather_stats[:data][:attributes][:hourly_weather].each do |hourly|
          expect(hourly).to be_a Hash
          expect(hourly).to have_key :time
          expect(hourly[:time]).to be_a String
          expect(hourly).to have_key :temp
          expect(hourly[:temp]).to be_a Float
          expect(hourly).to have_key :condition
          expect(hourly[:condition]).to be_a String
          expect(hourly).to have_key :icon
          expect(hourly[:icon]).to be_a String
        end
      end
    end
  end
end