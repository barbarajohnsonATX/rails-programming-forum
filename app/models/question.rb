class Question < ApplicationRecord
    belongs_to :user, :counter_cache => true
    belongs_to :category
    # Add dependent: :destroy so answers related to a specific question get deleted if the question is deleted
    has_many :answers, dependent: :destroy  

    validates :title, presence: true
    validates :description, presence: true
    validates :category_id, presence: true
 
    scope :created_today, -> { where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day).order('created_at DESC') }
    scope :unanswered, -> { where(answers_count: nil) }
  

end
