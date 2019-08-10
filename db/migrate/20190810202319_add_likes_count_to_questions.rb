class AddLikesCountToQuestions < ActiveRecord::Migration[5.2]
  def change
    add_column :questions, :likes_count, :integer

  end
end
