require 'rails_helper'

RSpec.describe 'Book Search API' do
  describe 'happy path' do
    it 'returns book data', :vcr do
      book_service = BookService.new
      book_results = book_service.get_books('Denver, CO')

      expect(book_results).to be_a Hash
      expect(book_results).to have_key :docs
      expect(book_results[:docs]).to be_an Array
      
      
    end
  end
end