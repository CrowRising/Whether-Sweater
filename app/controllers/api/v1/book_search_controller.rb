# frozen_string_literal: true

module Api
  module V1
    class BookSearchController < ApplicationController
      def index
        books = BooksFacade.new(params[:location], params[:quantity]).get_book_info
        render json: BookSearchSerializer.new(books)
      end
    end
  end
end
