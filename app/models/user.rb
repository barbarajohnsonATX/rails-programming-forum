class User < ApplicationRecord
    has_secure_password  #takes care of password validations 
    has_many :questions
    has_many :anwers
    has_many :categories, through: :questions
 
    validates :username, presence: true 
    validates :email, presence: true 
    validates :email, uniqueness: true 

    def self.create_by_google_omniauth(auth)
        find_or_create_by(email: auth[:info][:email]) do |u| 
            u.username = auth[:info][:name]
            #secure, randomly generated password
            u.password = SecureRandom.hex 
        end 
    end 

    def asked_by_me
       questions 
    end 

    def answered_by_me 
        answers
    end 

end
