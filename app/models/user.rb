class User < ApplicationRecord
    has_secure_password  #takes care of password validations 
    has_many :questions, dependent: :destroy 
    has_many :answers, dependent: :destroy
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

 


    def heart!(question)
        self.hearts.create!(question_id: question.id)
    end
      
    # destroys a heart with matching question_id and user_id
    def unheart!(question)
        heart = self.hearts.find_by(question_id: question.id)
        heart.destroy!
    end
      
    # returns true of false if a question is hearted by user
    def heart?(question)
        self.hearts.find_by(question_id: question.id)
    end

end
