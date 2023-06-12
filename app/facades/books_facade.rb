class BooksFacade
  def initialize(book_data)
    @book_data = book_data
  end

  def total_books_found
    @book_data[:num_found]
  end

  def books
    @book_data[:docs].map do |book_info|
      {
        title: book_info[:title],
        publisher: book_info[:publisher]&.first,
        isbn: book_info[:isbn]
      }
    end
  end
end