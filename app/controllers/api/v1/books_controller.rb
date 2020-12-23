class Api::V1::BooksController < ApplicationController

  def index
    books = Book.all
    render json: BookSerializer.new(books)

  end

  def create
    book = Book.new(book_params); book.quotes.build
    # byebug
    if book.save
      render json: book, include: :quotes, status: :accepted
    else
      render json: {errors: book.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def edit
    @book = Book.find_by(id: params[:id])
  end

  def update
    @book = Book.find_by(id: params[:id])
    if @book.update(book_params)
      render json: book, include: :quotes, status: :accepted
    else
      render json: {errors: book.errors.full_messages}, status: :unprocessable_entity
    end
  end

  private

  def book_params
    # params.require(:book).permit(:title, :author, :summary, quote_ids: [])
    params.require(:book).permit(:title, :author, :summary, quote_attributes: [:quote])
  end

end
