class CreateAnswerVotes < ActiveRecord::Migration
  def change
    create_table :answer_votes do |t|
      t.integer :user_id
      t.integer :answer_id
      t.integer :vote_state, default: 0

      t.timestamps null: false
    end
  end
end
