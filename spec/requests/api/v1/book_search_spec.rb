require 'rails_helper'

RSpec.describe 'Book Search API', type: :request do
  describe 'Search for books by location and quantity' do
    it 'returns book data', :vcr do
      get '/api/v1/book-search?location=denver,co&quantity=5'

      expect(response).to have_http_status :success
      expect(response.status).to eq(200)
    end
  end
end