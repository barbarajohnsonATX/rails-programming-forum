class Like < ApplicationRecord
  belongs_to :question, :counter_cache => true
  belongs_to :user

  
  #2.6.1 :062 > Like.group(:user_id).count
  #=> {2=>3, 4=>6, 5=>4, 7=>3, 8=>2, 9=>2, 12=>1, 13=>1, 14=>1} 

  #2.6.1 :066 > Like.group(:user_id).count.sort_by{|_key, value| value}.reverse
  #=> [[4, 6], [5, 4], [2, 3], [7, 3], [9, 2], [8, 2], [13, 1], [14, 1], [12, 1]] 

  #2.6.1 :067 > Like.group(:user_id).count.sort_by{|_key, value| value}.reverse.first[0]
  #=> 4 --> this is the user id

   scope :top_user, -> { User.where(id: (group(:user_id).count.sort_by {|_key, value| value}.reverse.first[0]))  }
 
 end
