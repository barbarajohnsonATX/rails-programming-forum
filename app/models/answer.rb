class Answer < ApplicationRecord
    belongs_to :question
    belongs_to :user
    validates :comment, presence: true

end
