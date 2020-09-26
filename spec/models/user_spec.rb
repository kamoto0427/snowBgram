require 'rails_helper'

describe User do
  describe '#create' do

    it "name,email,パスワード,パスワードの確認が全て存在すればユーザー登録できる" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "nameがない場合はユーザー登録できない" do
      user = build(:user, name: nil)
      user.valid?
      expect(user.errors[:name]).to include("を入力してください")
    end

  end
end