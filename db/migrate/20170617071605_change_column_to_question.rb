class ChangeColumnToQuestion < ActiveRecord::Migration
  def change
    change_column :questions, :vote_count, :integer, default: 0
  end
end
