class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :"tag"
      t.string :name_en
      t.string :name_ja
      t.timestamps null: false
    end
    add_index :tags, :name_en, unique: true
    add_index :tags, :name_ja, unique: true
  end
end
