class Question < ActiveRecord::Base
  belongs_to :user
  validates :title, presence: true
  validates :content, presence: true
  # tagのアソシエーションとQuestionレコード削除時に該当タグも消える
  has_many :tags, dependent: :destroy
end
