class Api::V1::BooksController < ApplicationController


  def index
    books = Book.all
    # options = {
    #   #include associated quotes
    #   include: [:quotes]
    # # has to match association/associated models
    # }
    # render json: books
    render json: BookSerializer.new(books)
    # render json: BookSerializer.new(books, options)
    # if including options, need to pass options into render object too: render json: BookSerializer.new(books, options)
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
