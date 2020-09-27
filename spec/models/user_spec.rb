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

    it "重複したemailが存在する場合は、ユーザー登録できない" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("はすでに存在します")
    end

    it "passwordが8文字以上であればユーザー登録できる" do
      user = build(:user, password: "Aaaa1234", password_confirmation: "Aaaa1234")
      expect(user).to be_valid
    end

    it "passwordが7文字以下であればユーザー登録できない" do
      user = build(:user, password: "Aaa1234", password_confirmation: "Aaa1234")
      user.valid?
      expect(user.errors[:password]).to include
    end

    it "パスワードに英小文字が含まれない場合は無効" do
      user = build(:user, password: '1'+'A' * 5, password_confirmation: '1A'+'a' * 3)
      user.valid?
      expect(user.errors[:password]).to include('は半角8文字以上の英大文字・小文字・数字それぞれ１文字以上含む必要があります ex.Aa000000')
    end

    it "パスワードに英大文字が含まれない場合は無効" do
      user = build(:user, password: '1'+'a' * 5, password_confirmation: '1A'+'a' * 3)
      user.valid?
      expect(user.errors[:password]).to include('は半角8文字以上の英大文字・小文字・数字それぞれ１文字以上含む必要があります ex.Aa000000')
    end

    it "パスワードに数字が含まれない場合は無効" do
      user = build(:user, password: 'A'+'a' * 5, password_confirmation: '1A'+'a' * 3)
      user.valid?
      expect(user.errors[:password]).to include('は半角8文字以上の英大文字・小文字・数字それぞれ１文字以上含む必要があります ex.Aa000000')
    end

  end
end