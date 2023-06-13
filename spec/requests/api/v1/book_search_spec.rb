# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Book Search API', type: :request do
  describe 'Search for books by location and quantity' do
    it 'returns book data', :vcr do
      get '/api/v1/book-search?location=denver,co&quantity=5'

      expect(response).to have_http_status :success
      expect(response.status).to eq(200)

      book_search_data = JSON.parse(response.body, symbolize_names: true)

      expect(book_search_data).to be_a Hash
      expect(book_search_data).to have_key :data
      expect(book_search_data[:data]).to be_a Hash
      expect(book_search_data[:data]).to have_key :id
      expect(book_search_data[:data][:id]).to eq(nil)
      expect(book_search_data[:data]).to have_key :type
      expect(book_search_data[:data][:type]).to eq('books')
      expect(book_search_data[:data]).to have_key :attributes
      expect(book_search_data[:data][:attributes]).to be_a Hash
      expect(book_search_data[:data][:attributes]).to have_key :destination
      expect(book_search_data[:data][:attributes][:destination]).to be_a String
      expect(book_search_data[:data][:attributes]).to have_key :forecast
      expect(book_search_data[:data][:attributes][:forecast]).to be_a Hash
      expect(book_search_data[:data][:attributes][:forecast]).to have_key :summary
      expect(book_search_data[:data][:attributes][:forecast][:summary]).to be_a String
      expect(book_search_data[:data][:attributes][:forecast]).to have_key :temperature
      expect(book_search_data[:data][:attributes][:forecast][:temperature]).to be_a String
      expect(book_search_data[:data][:attributes]).to have_key :total_books_found
      expect(book_search_data[:data][:attributes][:total_books_found]).to be_an Integer
      expect(book_search_data[:data][:attributes]).to have_key :books
      expect(book_search_data[:data][:attributes][:books]).to be_an Array
      expect(book_search_data[:data][:attributes][:books].count).to eq(5)
      expect(book_search_data[:data][:attributes][:books].first).to be_a Hash
      expect(book_search_data[:data][:attributes][:books].first).to have_key :isbn
      expect(book_search_data[:data][:attributes][:books].first[:isbn]).to be_an Array
      expect(book_search_data[:data][:attributes][:books].first).to have_key :title
      expect(book_search_data[:data][:attributes][:books].first[:title]).to be_a String
      expect(book_search_data[:data][:attributes][:books].first).to have_key :publisher
      expect(book_search_data[:data][:attributes][:books].first[:publisher]).to be_an Array
    end
  end
end
