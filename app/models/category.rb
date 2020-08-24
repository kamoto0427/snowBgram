class Category < ApplicationRecord
  has_many :post_category, dependent: :destroy
  has_many :posts, through: :post_category
  has_ancestry
end
