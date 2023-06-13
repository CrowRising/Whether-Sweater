require 'rails_helper'

RSpec.describe 'Activities API', type: :request do 
  describe 'Search for activities' do
    it 'returns activity data', :vcr do
      get '/api/v1/activities?destination=chicago,il'

      expect(response).to have_http_status :success
      expect(response.status).to eq(200)

    end
  end
end