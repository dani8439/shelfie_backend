class Book < ApplicationRecord
  has_many :quotes, dependent: :destroy  
end
