class BookSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :author, :summary, :quotes, quote_ids: []





  # so much bloat this way though
  # attributes :title, :author, :summary, quote_ids: []
  # has_many :quotes


  # in order to add relationships to our API have to add has_many: quotes here ??, remove :quotes from above attributes
  # would add a relationships object to JSON Hash.

  # quote_ids: [], :quotes throws an error, needs to be reversed to what Ayana had in video
end
