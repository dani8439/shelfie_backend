class QuoteSerializer
  include FastJsonapi::ObjectSerializer
  attributes :quote, :book_id, :book



end
