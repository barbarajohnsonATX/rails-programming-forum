class Answer < ApplicationRecord
    #belongs_to :question
    belongs_to :question, :counter_cache => true
    belongs_to :user
    validates :comment, presence: true

 
    def self.answered_by_me(user)
        where(user_id: user.id)
    end 

end
