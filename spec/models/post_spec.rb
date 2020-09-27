require 'rails_helper'

describe Post do
  describe '#create' do
    
    it "title,appeal,image全てあれば投稿できる" do
      post = build(:post)
      expect(post).to be_valid
    end

    it "titleがない場合は投稿できない" do
      post = build(:post, title: nil)
      post.valid?
      expect(post.errors[:title]).to include("を入力してください")
    end

    it "appealがない場合は投稿できない" do
      post = build(:post, appeal: nil)
      post.valid?
      expect(post.errors[:appeal]).to include("を入力してください")
    end

    it "imageがない場合は投稿できない" do
      post = build(:post, image: nil)
      post.valid?
      expect(post.errors[:image]).to include("を入力してください")
    end

  end
end