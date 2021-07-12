class User < ApplicationRecord
    has_secure_password

    has_many :books, dependent: :destroy 
    has_many :quotes, through: :books
    # validates :username, uniqueness: { case_sensitive: false }
end
