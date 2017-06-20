class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  validates :content, presence: true
  has_many :answer_votes, dependent: :destroy
  has_many :answer_vote_users, through: :answer_vote, source: :user
end
