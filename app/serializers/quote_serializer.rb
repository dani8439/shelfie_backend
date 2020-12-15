class QuoteSerializer
  include FastJsonapi::ObjectSerializer
  attributes :snippet, :book_id, :book

  #in front end for each quote card can iterate over json.data, will be able to iterate,
  # attributes.quote, attributes.book.title, attributes.book.author etc, etc.


end
