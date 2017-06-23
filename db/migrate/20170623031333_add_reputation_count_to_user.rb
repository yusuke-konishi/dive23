class AddReputationCountToUser < ActiveRecord::Migration
  def change
    add_column :users, :reputation_count, :integer, default: 0
  end
end
