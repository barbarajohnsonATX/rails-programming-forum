class AddAnswersCountToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :answers_count, :integer
  end
end
