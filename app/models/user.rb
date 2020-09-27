class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[\d])\w{8,100}\z/
  validates :password, presence: true,
             format: { with: VALID_PASSWORD_REGEX,
              message: "は半角8文字以上の英大文字・小文字・数字それぞれ１文字以上含む必要があります ex.Aa000000"},
             length: { minimum: 8 }
             
  attachment :profile_image
  has_many :posts, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :comments

  def already_favorited?(post)
    self.favorites.exists?(post_id: post.id)
  end
end
