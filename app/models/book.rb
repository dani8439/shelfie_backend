class Book < ApplicationRecord
  belongs_to :user 
  has_many :quotes, dependent: :destroy
  accepts_nested_attributes_for :quotes, reject_if: lambda {|attributes| attributes['quote'].blank?}
  
  # accepts_nested_attributes_for :quotes, allow_destroy: true
  # dependent: :destroy -- not allowing save of both records. stick with allow_destroy, permits .destroy to be called, not .delete. Why?


end
