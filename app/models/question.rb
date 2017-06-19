class Question < ActiveRecord::Base
  belongs_to :user
  validates :title, presence: true
  validates :content, presence: true
  has_many :tags, dependent: :destroy
  has_many :answers, dependent: :destroy
  acts_as_taggable_on :labels # post.label_list が追加される
  acts_as_taggable            # acts_as_taggable_on :tags のエイリアス
end
