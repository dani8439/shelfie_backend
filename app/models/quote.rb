class Quote < ApplicationRecord
  belongs_to :book

  # Want to possibly be able to show quotes, and then book attributes beyond id. Do not want all attributes shown
  # though as shown when calling book through JSON Serializer? 
  # accepts_nested_attributes_for :books, allow_destroy: true
end
