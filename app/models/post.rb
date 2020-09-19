class Post < ApplicationRecord
  belongs_to :user
  attachment :image
  belongs_to :category
  has_many :favorites, dependent: :destroy
  has_many :comments

  with_options presence: true do
    validates :title
    validates :appeal
    validates :image
  end
end
