class Tag < ApplicationRecord
    has_many :question_tags, dependent: :destroy
    has_many :questions, through: :question_tags
    
    scope :search_by_tag, -> (search_tag){where("name = ?", search_tag)}

end
