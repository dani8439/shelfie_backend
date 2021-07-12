class User < ApplicationRecord
    has_secure_password

    has_many :books, dependent: :destroy 
    # validates :username, uniqueness: { case_sensitive: false }
end
