require 'rails_helper'

describe Comment do
  describe '#create' do
    
    it "textがあれば、コメントできる" do
      comment = build(:comment)
      expect(comment).to be_valid
    end

    it "textがなければ、コメントできない" do
      comment = build(:comment, text: nil)
      comment.valid?
      expect(comment.errors[:text]).to include("を入力してください")
    end
  end
end