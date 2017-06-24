class Question < ActiveRecord::Base
  belongs_to :user
  validates :title, presence: true
  validates :content, presence: true
  has_many :tags, dependent: :destroy
  has_many :answers, dependent: :destroy
  has_many :question_votes, dependent: :destroy
  has_many :question_vote_users, through: :question_votes, source: :user
  has_many :bookmarked_users, through: :bookmarks, source: :user
  has_many :bookmarks, dependent: :destroy

  acts_as_taggable
  scope :index_all, -> {
  select(:id, :title, :content, :created_at, :user_id, :updated_at, :vote_count, :bookmarks_count)
  .order(created_at: :desc)
  .includes(:user)
  }
  paginates_per 4
end
