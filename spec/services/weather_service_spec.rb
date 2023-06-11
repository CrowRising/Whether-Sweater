require 'rails_helper'

RSpec.describe WeatherService do
  describe 'connection exists' do
    it 'it can connect to weather api', :vcr do
      weather_service = MapService.new
      weather_results = weather_service.get_weather('39.74001, -104.99202')

      expect(weather_results).to be_a Hash
    end

    it 'can retunr current weather and forecast by location' do
      weather_service = MapService.new
      weather_results = weather_service.get_weather('39.74001, -104.99202')

      expect(weather_results).to have_key :current
      expect(weather_results[:current]).to have_key :last_updated
      expect(weather_results[:current][:last_updated]).to be_a String
      expect(weather_results[:current]).to have_key :temp_f
      expect(weather_results[:current][:temp_f]).to be_a Float
      expect(weather_results[:current]).to have_key :humidity
      expect(weather_results[:current][:humidity]).to be_a Integer
      expect(weather_results[:current]).to have_key :feels_like_f
      expect(weather_results[:current][:feels_like_f]).to be_a Float
      expect(weather_results[:current]).to have_key :vis_miles
      expect(weather_results[:current][:vis_miles]).to be_a Float
      expect(weather_results[:current]).to have_key :uv
      expect(weather_results[:current][:uv]).to be_a Float

      expect(weather_results).ot have_key :forecast
      expect(weather_results[:forecast][:forecastday]).to be_an Array
      expect(weather_results[:forecast][:forecastday][0][:day]).to have_key :condition
      expect(weather_results[:forecast][:forecastday][0][:condtion]).to have_key :text
      expect(weather_results[:forecast][:forecastday][0][:condtion][:text]).to be_a String
      expect(weather_results[:forecast][:forecastday][0][:condtion]).to have_key :icon
      expect(weather_results[:forecast][:forecastday][0][:condtion][:icon]).to be_a String
    end
  end
end

