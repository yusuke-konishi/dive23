class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title
      t.string :content
      t.integer :user_id
      t.integer :vote_count

      t.timestamps null: false
    end
  end
end
