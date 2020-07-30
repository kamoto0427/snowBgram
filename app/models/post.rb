class Post < ApplicationRecord
  belongs_to :user
  attachment :image
  has_many :favorites, dependent: :destroy
  has_many :comments

  with_options presence: true do
    validates :title
    validates :body
    validates :image
  end

  def favorite_user(user_id)
    favorites.find_by(user_id: user_id)
  end
end
