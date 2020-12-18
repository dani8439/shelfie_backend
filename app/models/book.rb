class Book < ApplicationRecord
  has_many :quotes, dependent: :destroy
  # accepts_nested_attributes_for :quotes 
end
