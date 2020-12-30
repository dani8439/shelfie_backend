class Book < ApplicationRecord
  has_many :quotes, dependent: :destroy
  accepts_nested_attributes_for :quotes, reject_if: lambda {|attributes| attributes['quote'].blank?}
  # # to not save any quotes if quote field is blank.

  # def quote_attributes=(params)
  #   @params = params
  #   byebug
  # end
end
