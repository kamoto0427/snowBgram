class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :post, counter_cache: :favorites_count

  validates_uniqueness_of :post_id, scope: :user_id
end
