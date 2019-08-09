class Question < ApplicationRecord
    attr_accessor :tag_list


    #belongs_to :user
    belongs_to :user, :counter_cache => true
    belongs_to :category
    # Add dependent: :destroy so answers related to a specific question get deleted if the question is deleted
    has_many :answers, dependent: :destroy  

    has_many :question_tags, dependent: :destroy
	has_many :tags, through: :question_tags
    has_many :likes, dependent: :destroy
 

    validates :title, presence: true
    validates :description, presence: true
    validates :category_id, presence: true
 
    scope :created_today, -> { where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day).order('created_at DESC') }
    scope :unanswered, -> { where(answers_count: nil) }
    scope :top, -> (n) { order(answers_count: :desc).limit(n) }
    scope :order_newest, ->  { order ('updated_at DESC') }

    #join Question and Like tables, and get likes with user_id=user.id
    scope :liked_by, -> (user) { joins(:likes).where(likes: {user_id: user.id}) }
 

    def tag_list=(names)
        #Collect the individual names in an array
         tag_names = names.split(",").map do |n| 
            n.strip.downcase
         end.uniq

        #Find the tag in db, or create a new one if it does not exist
        new_or_existing_tags = tag_names.map do |tag_name| 
            Tag.find_or_create_by(name: tag_name)
        end 

        #Associate the Question instance with the tags 
        self.tags = new_or_existing_tags
 	end

     # Join all tag names with a comma to populate tag_list field
    def tag_list 
        tags.map do |t| 
            t.name 
        end.join(", ")
    end
    

end
