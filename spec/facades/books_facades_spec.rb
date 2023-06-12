require 'rails_helper'

RSpec.describe BooksFacade do
  describe 'BooksFacade methods' do
    let(:book_data) do
      {
        num_found: 172,
        docs: [
          {
            isbn: ['0762507845', '9780762507849'],
            title: 'Denver, Co',
            publisher: ['Universal Map Enterprises']
          },
          {
            isbn: ['9780883183663', '0883183668'],
            title: 'Photovoltaic safety, Denver, CO, 1988',
            publisher: ['American Institute of Physics']
          }
        ]
      }
    end

    let(:books_facade) { BooksFacade.new(book_data) }

    it 'returns the total number of books found' do
      expect(books_facade.total_books_found).to eq(172)
    end

    it 'returns an array of books' do
      expect(books_facade.books).to be_an Array
      expect(books_facade.books.count).to eq(2)
      expect(books_facade.books.first).to be_a Hash
      expect(books_facade.books.first).to have_key :isbn
      expect(books_facade.books.first).to have_key :title
      expect(books_facade.books.first).to have_key :publisher
    end
  end
end
