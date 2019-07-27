class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.string :title
      t.text :description
      t.integer :user_id
      t.integer :category_id
      t.boolean :answered, :default => false

      t.timestamps
    end
  end
end
