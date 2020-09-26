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

    it "emailがない場合はユーザー登録できない" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    it "passwordがない場合はユーザー登録できない" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end

    it "passwordが存在してもpassword_confirmationがない場合はユーザー登録できない" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
    end

  end
end