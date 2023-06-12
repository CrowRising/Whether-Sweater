require 'rails_helper'

RSpec.describe BooksFacade do
  describe 'BooksFacade methods', :vcr do
    let(:books_facade) { BooksFacade.new('denver, co', 5).get_book_info }

    it 'returns the total number of books found' do
      expect(books_facade.total_books_found).to eq(758)
    end

    it 'returns an array of books' do
      expect(books_facade.books).to be_an Array
      expect(books_facade.books.count).to eq(5)
      expect(books_facade.books.first).to be_a Hash
      expect(books_facade.books.first).to have_key :isbn
      expect(books_facade.books.first).to have_key :title
      expect(books_facade.books.first).to have_key :publisher
    end
  end
end
