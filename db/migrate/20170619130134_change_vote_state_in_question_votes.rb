class ChangeVoteStateInQuestionVotes < ActiveRecord::Migration
  def change
    remove_column :question_votes, :vote_state
    add_column :question_votes, :vote_state, :integer, default: 0
  end
end
