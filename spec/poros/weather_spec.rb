# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Weather do
  describe 'weather poros' do
    it 'exists and has attributes' do
      forecast_data = {
        current_weather: {
          last_updated: '2023-06-10 19:45',
          temp_f: 62.2,
          condition: 'Moderate or heavy rain with thunder',
          icon: '//cdn.weatherapi.com/weather/64x64/day/389.png',
          humidity: 55,
          feelslike_f: 62.2,
          vis_miles: 9.0,
          uvi: 4.0
        },
        daily_weather: [
          {
            date: '2023-06-10',
            sunrise: '5:32',
            sunset: '20:27',
            max_temp: 75.9,
            min_temp: 54.5,
            icon: '//cdn.weatherapi.com/weather/64x64/day/389.png'
          },
          {
            date: '2023-06-10',
            sunrise: '5:32',
            sunset: '20:27',
            max_temp: 75.9,
            min_temp: 54.5,
            icon: '//cdn.weatherapi.com/weather/64x64/day/389.png'
          }
        ],
        hourly_weather: [
          {
            time: '2023-06-10 00:00',
            temp: 57.4,
            condition: 'Clear',
            icon: '//cdn.weatherapi.com/weather/64x64/night/113.png'
          }
        ]
      }

      weather_stats = Weather.new(forecast_data)

      expect(weather_stats).to be_a Weather
      expect(weather_stats.current_weather).to be_a Hash
      expect(weather_stats.current_weather).to have_key :last_updated
      expect(weather_stats.current_weather).to have_key :temp_f
      expect(weather_stats.current_weather).to have_key :condition

      expect(weather_stats.current_weather).to have_key :icon
      expect(weather_stats.current_weather).to have_key :humidity
      expect(weather_stats.current_weather).to have_key :feelslike_f
      expect(weather_stats.current_weather).to have_key :vis_miles
      expect(weather_stats.current_weather).to have_key :uvi

      expect(weather_stats.daily_weather).to be_an Array
      expect(weather_stats.daily_weather.count).to eq(2)
      expect(weather_stats.daily_weather.first).to be_a Hash
      expect(weather_stats.daily_weather.first).to have_key :date
      expect(weather_stats.daily_weather.first).to have_key :sunrise
      expect(weather_stats.daily_weather.first).to have_key :sunset
      expect(weather_stats.daily_weather.first).to have_key :max_temp
      expect(weather_stats.daily_weather.first).to have_key :min_temp
      expect(weather_stats.daily_weather.first).to have_key :icon

      expect(weather_stats.hourly_weather).to be_an Array
      expect(weather_stats.hourly_weather.count).to eq(1)
      expect(weather_stats.hourly_weather.first).to be_a Hash
      expect(weather_stats.hourly_weather.first).to have_key :time
      expect(weather_stats.hourly_weather.first).to have_key :temp
      expect(weather_stats.hourly_weather.first).to have_key :condition
      expect(weather_stats.hourly_weather.first).to have_key :icon
    end
  end
end
