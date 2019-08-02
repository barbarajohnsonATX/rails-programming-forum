class AddQuestionsCountToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :questions_count, :integer
  end
end
