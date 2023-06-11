# frozen_string_literal: true

require 'rails_helper'

RSpec.describe WeatherService do
  describe 'connection exists' do
    it 'it can connect to weather api', :vcr do
      weather_service = WeatherService.new
      weather_results = weather_service.get_weather('39.74001', '-104.99202')

      expect(weather_results).to be_a Hash
    end

    it 'can return current weather and forecast by location', :vcr do
      weather_service = WeatherService.new
      weather_results = weather_service.get_weather('39.74001', '-104.99202')

      expect(weather_results).to have_key :current
      expect(weather_results[:current]).to have_key :last_updated
      expect(weather_results[:current][:last_updated]).to be_a String
      expect(weather_results[:current]).to have_key :temp_f
      expect(weather_results[:current][:temp_f]).to be_a Float
      expect(weather_results[:current]).to have_key :humidity
      expect(weather_results[:current][:humidity]).to be_a Integer
      expect(weather_results[:current]).to have_key :feelslike_f
      expect(weather_results[:current][:feelslike_f]).to be_a Float
      expect(weather_results[:current]).to have_key :vis_miles
      expect(weather_results[:current][:vis_miles]).to be_a Float
      expect(weather_results[:current]).to have_key :uv
      expect(weather_results[:current][:uv]).to be_a Float

      expect(weather_results).to have_key :forecast
      expect(weather_results[:forecast][:forecastday]).to be_an Array
      expect(weather_results[:forecast][:forecastday][0][:day]).to have_key :condition
      expect(weather_results[:forecast][:forecastday][0][:day][:condition]).to have_key :text
      expect(weather_results[:forecast][:forecastday][0][:day][:condition][:text]).to be_a String
      expect(weather_results[:forecast][:forecastday][0][:day][:condition]).to have_key :icon
      expect(weather_results[:forecast][:forecastday][0][:day][:condition][:icon]).to be_a String
    end

    it 'can return daily weather for a 5 day forecast', :vcr do
      weather_service = WeatherService.new
      weather_results = weather_service.get_weather('39.74001', '-104.99202')

      expect(weather_results).to have_key :forecast
      expect(weather_results[:forecast][:forecastday]).to be_an Array

      weather_results[:forecast][:forecastday].each do |daily|
        expect(daily).to have_key :date
        expect(daily[:date]).to be_a String
        expect(daily).to have_key :day
        expect(daily[:day]).to be_a Hash
        expect(daily[:day]).to have_key :maxtemp_f
        expect(daily[:day][:maxtemp_f]).to be_a Float
        expect(daily[:day]).to have_key :mintemp_f
        expect(daily[:day][:mintemp_f]).to be_a Float
        expect(daily[:day]).to have_key :condition
        expect(daily[:day][:condition]).to have_key :text
        expect(daily[:day][:condition][:text]).to be_a String
        expect(daily[:day][:condition]).to have_key :icon
        expect(daily[:day][:condition][:icon]).to be_a String
        expect(daily[:astro]).to have_key :sunrise
        expect(daily[:astro][:sunrise]).to be_a String
        expect(daily[:astro]).to have_key :sunset
        expect(daily[:astro][:sunset]).to be_a String
      end
    end

    it 'can return hourly weather for the current day', :vcr do
      weather_service = WeatherService.new
      weather_results = weather_service.get_weather('39.74001', '-104.99202')

      expect(weather_results[:forecast][:forecastday][0]).to have_key :hour
      expect(weather_results[:forecast][:forecastday][0][:hour]).to be_an Array

      weather_results[:forecast][:forecastday][0][:hour].each do |hourly|
        expect(hourly).to have_key :time
        expect(hourly[:time]).to be_a String
        expect(hourly).to have_key :temp_f
        expect(hourly[:temp_f]).to be_a Float
        expect(hourly).to have_key :condition
        expect(hourly[:condition]).to have_key :text
        expect(hourly[:condition][:text]).to be_a String
        expect(hourly[:condition]).to have_key :icon
        expect(hourly[:condition][:icon]).to be_a String
      end
    end
  end
end
