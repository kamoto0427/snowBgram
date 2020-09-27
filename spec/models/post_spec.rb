require 'rails_helper'

describe Post do
  describe '#create' do
    
    it "title,appeal,image全てあれば投稿できる" do
      post = build(:post)
      expect(post).to be_valid
    end
    
  end
end