require 'rails_helper'

RSpec.describe WeatherFacade do
  describe 'WeatherFacade methods' do
    it 'class/instance methods', :vcr do
      weather_stats = WeatherFacade.new('Denver, CO').weather

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
      expect(weather_stats.daily_weather.first).to be_a Hash
      expect(weather_stats.daily_weather.first).to have_key :date
      expect(weather_stats.daily_weather.first).to have_key :sunrise
      expect(weather_stats.daily_weather.first).to have_key :sunset
      expect(weather_stats.daily_weather.first).to have_key :max_temp
      expect(weather_stats.daily_weather.first).to have_key :min_temp
      expect(weather_stats.daily_weather.first).to have_key :icon
      expect(weather_stats.daily_weather.count).to eq(5)

      expect(weather_stats.hourly_weather).to be_an Array
      expect(weather_stats.hourly_weather.count).to eq(24)
      expect(weather_stats.hourly_weather.first).to be_a Hash
      expect(weather_stats.hourly_weather.first).to have_key :time
      expect(weather_stats.hourly_weather.first).to have_key :temp
      expect(weather_stats.hourly_weather.first).to have_key :condition
      expect(weather_stats.hourly_weather.first).to have_key :icon
    end
  end
end