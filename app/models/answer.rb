class Answer < ApplicationRecord
     # counter_cache to optimize querying faster
    belongs_to :question, :counter_cache => true
    belongs_to :user, :counter_cache => true
     
    validates :comment, presence: true

    scope :answered_by, -> (user) { where(user_id: user.id) }
 
    # def self.answered_by_me(user)
    #     where(user_id: user.id)
    # end 

  
       


end
