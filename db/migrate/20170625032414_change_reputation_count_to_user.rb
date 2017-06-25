class ChangeReputationCountToUser < ActiveRecord::Migration
  def up
    change_column :users, :reputation_count, :integer, default: 1
  end
  def down
    change_column :users, :reputation_count, :integer, default: 0
  end
end
