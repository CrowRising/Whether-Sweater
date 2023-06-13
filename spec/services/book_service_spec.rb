# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Book Search API' do
  describe 'happy path' do
    it 'returns book data', :vcr do
      book_service = BookService.new
      book_results = book_service.get_books('Denver, CO', 5)

      expect(book_results).to be_a Hash
      expect(book_results).to have_key :docs
      expect(book_results[:docs]).to be_an Array

      book = book_results[:docs].first

      expect(book).to have_key :title
      expect(book[:title]).to be_a String

      expect(book).to have_key :publisher
      expect(book[:publisher]).to be_an Array

      expect(book).to have_key :isbn
      expect(book[:isbn]).to be_an Array

      expect(book_results).to have_key :numFound
      expect(book_results[:numFound]).to be_an Integer
    end
  end
end
