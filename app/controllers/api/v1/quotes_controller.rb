class Api::V1::QuotesController < ApplicationController

  def index
    quotes = Quote.all
    render json: QuoteSerializer.new(quotes)
  end

  def create
    quote = Quote.new(quote_params)
    if quote.save
      render json: quote, status: :accepted
    else
      render json: {errors: quote.errors.full_messages}, status: :unprocessable_entity
    end
  end


  private

  def quote_params
    params.require(:quote).permit(:quote, :book_id)
  end
end
