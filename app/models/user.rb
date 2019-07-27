class User < ApplicationRecord
    has_secure_password  #takes care of password validations 
    has_many :questions
    validates :username, :email, presence: true 
    validates :username, :email, uniqueness: true 

end
