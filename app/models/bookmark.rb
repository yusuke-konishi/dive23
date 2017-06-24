class Bookmark < ActiveRecord::Base
  belongs_to :user
  belongs_to :question, counter_cache: :bookmarks_count
end
