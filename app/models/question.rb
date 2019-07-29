class Question < ApplicationRecord
    belongs_to :user 
    belongs_to :category
    has_many :answers

    validates :title, presence: true
    validates :description, presence: true
    validates :category_id, presence: true
 

end
