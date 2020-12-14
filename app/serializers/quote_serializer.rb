class QuoteSerializer
  include FastJsonapi::ObjectSerializer
  attributes :quote, :book, :book_id
  # what attributes show up in route, rendered in json. Do I need book_id AND book?
end
