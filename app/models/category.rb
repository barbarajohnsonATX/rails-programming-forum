class Category < ApplicationRecord
    has_many :questions, dependent: :destroy 
    has_many :answers, through: :questions
    validates :name, presence: true
 
    scope :by, -> (language) { where(name: language) }

end
