class Api::V1::BooksController < ApplicationController

  def index
    books = Book.all
    render json: BookSerializer.new(books)

  end

  def new
    book = Book.new; book.quotes.build
  end

  def create
    book = Book.create(book_params)
    if book.save
      render json: BookSerializer.new(book), status: :accepted

      # render json: book, include: :quotes, status: :accepted
    else
      render json: {errors: book.errors.full_messages}, status: :unprocessable_entity
    end
  end


  def edit
    book = Book.find_by(id: params[:id])
  end

  def update
    book = Book.find_by(id: params[:id])
    # book.quotes =
    # not updating quotes, updating book.
    # book.update(book_params)
    # debugger
    if book.update(book_params)
      # book.save(book_params)
      # if book.quotes = Book.update(params[:quotes_attributes])
      # render json: BookSerializer.new(book, include: [:quote_attributes]), status: :accepted
      render json: BookSerializer.new(book), status: :accepted
      # render json: book, include: :quotes, status: :accepted
    else
      render json: {errors: book.errors.full_messages}, status: :unprocessable_entity
    #  end
    end
  end

  private

  # possibly need [:id] passed into params so that the association can update according to stackexchange?
  def book_params
    params.require(:book).permit(:title, :author, :summary, quotes_attributes: [:id, :quote, :_destroy])
  end

end
