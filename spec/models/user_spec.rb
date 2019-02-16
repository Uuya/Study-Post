require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = build(:user)
  end

  describe 'バリデーション' do
    it 'name, email, passwordの値が設定されていればOK' do
      expect(@user.valid?).to eq(true)
    end

    it 'nameが空だとNG' do
      user = build(:user, name: nil)
      user.valid?
      expect(user.errors[:name]).to include("を入力してください")
    end

    it 'emailが空だとNG' do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    it 'passwordが空だとNG' do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end

    it 'nameが8文字以下だとOK' do
      @user.name = '12345678'
      expect(@user.valid?).to eq(true)
    end

    it 'nameが8文字以上だとNG' do
      user = build(:user, name: "123456789")
      user.valid?
      expect(user.errors[:name][0]).to include("は8文字以内で入力してください")
    end

    it "重複したemailが存在するときNG" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("はすでに存在します")
    end

    it "passwordとpassword_confirmationが同じでないとNG" do
      user = build(:user, password: "123456", password_confirmation: "123456789")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
    end

    it "passwordが6文字以上だとOK " do
      user = build(:user, password: "123456", password_confirmation: "123456")
      expect(user.valid?).to eq(true)
    end

    it "passwordが5文字以下だとNG " do
      user = build(:user, password: "12345", password_confirmation: "12345")
      user.valid?
      expect(user.errors[:password][0]).to include("は6文字以上で入力してください")
    end
  end
end
