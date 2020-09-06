class Category < ApplicationRecord
  has_ancestry
  has_many :posts

  def set_posts

    if self.root?
      start_id = self.indirects.first.id
      end_id = self.indirects.last.id
      posts = Post.where(category_id: start_id..end_id)
      return posts

    else self.has_children?
      start_id = self.children.first.id
      end_id = self.children.last.id
      posts = Post.where(category_id: start_id..end_id)
      return self.posts
    end
  end
end
