class Book < ApplicationRecord
  has_many :quotes, dependent: :destroy
  # accepts_nested_attributes_for :quotes, reject_if: lambda {|attributes| attributes['quote'].blank?}, allow_destroy: true
  accepts_nested_attributes_for :quotes, allow_destroy: true

end
