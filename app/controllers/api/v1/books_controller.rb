class Api::V1::BooksController < ApplicationController


  def index
    books = Book.all
    render json: books
    # don't need instance variables here,  @books = Book.all
    # render json: book -- because rendering directly with json, instead of dealing wtih erb views.
  end


  def create
    book = Book.new(book_params)
    if book.save
      render json: book, status: :accepted
    else
      render json: {errors: book.errors.full_messages}, status: :unprocessible_entity
    end

  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :summary, quote_ids: [])
  end

end
