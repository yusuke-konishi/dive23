class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # tagのアソシエーションと Userレコード削除時に該当タグも消える
  has_many :tags, dependent: :destroy
end
