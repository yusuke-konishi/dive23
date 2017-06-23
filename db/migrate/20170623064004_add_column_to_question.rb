class AddColumnToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :bookmarks_count, :integer, default: 0
  end
end
