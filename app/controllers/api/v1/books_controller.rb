class Api::V1::BooksController < ApplicationController

  def index
    books = Book.all
    render json: BookSerializer.new(books)

  end


    # def index
    #   books = Book.all
      # this is the alternative to adding macro's onto the serializer model. Seems more confusing. Ayana explains in video 2 starting at 1:20:00, and code is included in project build notes.
      # options = {
      #   #include associated quotes
      #   include: [:quotes]
      # # has to match association/associated models
      # }
      # render json: BookSerializer.new(books, options)
      # if including options, need to pass options into render object too: render json: BookSerializer.new(books, options)
      # don't need instance variables here,  @books = Book.all
      # render json: book -- because rendering directly with json, instead of dealing wtih erb views.
    # end


  def create
    book = Book.new(book_params)
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
    params.require(:book).permit(:title, :author, :summary, quote_ids: [])
  end

end
