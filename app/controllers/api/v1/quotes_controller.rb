class Api::V1::QuotesController < ApplicationController

  def index
    quotes = Quote.all
    render json: QuoteSerializer.new(quotes)
  end

  def create
    # puts params.inspect
    book_id = params[:book_id]
    text = params[:quote]
    if !text.blank?
      quote = Quote.new({ book_id: book_id, quote: text})
      if quote.save
        render json: QuoteSerializer.new(quote), status: :accepted
      else
        render json: {errors: quote.errors.full_messages}, status: :unprocessable_entity
      end
    else
      render json: {errors: quote.errors.full_messages}, status: :unprocessable_entity
    end
  end


  private

  def quote_params
    params.require(:quote).permit(:quote, :book_id)
  end

end
