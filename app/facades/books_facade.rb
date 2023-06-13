# frozen_string_literal: true

class BooksFacade
  def initialize(location, quantity)
    @locations = location
    @quantity = quantity
  end

  def get_book_info
    Books.new(@locations, forecast, total_books_found, books)
  end

  def total_books_found
    book_results[:num_found]
  end

  def books
    book_results[:docs].map do |book_info|
      {
        title: book_info[:title],
        publisher: book_info[:publisher],
        isbn: book_info[:isbn]
      }
    end
  end

  def forecast
    weather_facade.book_weather
  end

  private

  def book_service
    @book_service ||= BookService.new
  end

  def book_results
    @book_results ||= book_service.get_books(@locations, @quantity)
  end

  def weather_facade
    @weather_facade ||= WeatherFacade.new(@locations)
  end
end
