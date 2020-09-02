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

  has_many :post_categories, dependent: :destroy
  has_many :categories, through: :post_categories
  accepts_nested_attributes_for :categories, allow_destroy: true
end
