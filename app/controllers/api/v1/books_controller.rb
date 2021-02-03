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
    if book.update(book_params)
      render json: BookSerializer.new(book), status: :accepted
      # render json: book, include: :quotes, status: :accepted
    else
      render json: {errors: book.errors.full_messages}, status: :unprocessable_entity
    #  end
    end
  end

  def delete
    # destroy preferred as will delete record from db and it's associated children. Delete will not.
    book = Book.find_by(id: params[:id])
    book.destroy
    render json: book
    # unless book.nil?
    #   book.destroy
    #   render json: book
    # else
    #   render json: { error: "Book not Found!" }, status: :unprocessable_entity
    # end
  end

  private

  # possibly need [:id] passed into params so that the association can update according to stackexchange?
  def book_params
    params.require(:book).permit(:id, :title, :author, :summary, :quotes_attributes => [:id, :quote, :_destroy])
  end

end
