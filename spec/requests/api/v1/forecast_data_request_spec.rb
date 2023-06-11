require 'rails_helper'

RSpec.describe 'ForecastData', type: :request do
  describe 'Forecast for specific location' do
    it 'can return forecast data for specific location', :vcr do
      get '/api/v1/forecast?location=denver,co'

      expect(response).to have_http_status :success
    end
  end
end