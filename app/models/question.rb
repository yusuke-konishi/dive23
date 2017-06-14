class Question < ActiveRecord::Base
  # tagのアソシエーションとQuestionレコード削除時に該当タグも消える
  has_many :tags, dependent: :destroy
end
