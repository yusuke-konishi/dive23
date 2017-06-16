class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  # tagのアソシエーションと Userレコード削除時に該当タグも消える
  has_many :tags, dependent: :destroy
  has_many :questions
  has_many :answers
  has_many :bookmarks, dependent: :destroy
  has_many :votes, dependent: :destroy
end
