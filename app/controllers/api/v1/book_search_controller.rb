class Api::V1::BookSearchController < ApplicationController

  def index
    books = BooksFacade.new(params[:location], params[:quantity]).get_book_info
    render json: BookSearchSerializer.new(books)
  end
end
