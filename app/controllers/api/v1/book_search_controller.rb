class Api::V1::BookSearchController < ApplicationController
  def index
    location = params[:location]
    quantity = params[:quantity].to_i

    book_results = BookService.new.get_books(location, quantity)

    render json: book_results
  end
end