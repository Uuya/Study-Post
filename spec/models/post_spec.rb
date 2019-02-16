require 'rails_helper'

RSpec.describe Post, type: :model do

  describe 'バリデーション' do

    it 'title, studied_at, study_time, study_minutes, content, study_methodの値が設定されていればOK' do
      post = build(:post)
      expect(post.valid?).to eq(true)
    end

    it 'titleが空だとNG' do
      post = build(:post, title: nil)
      post.valid?
      expect(post.errors[:title]).to include("を入力してください")
    end

    it 'studied_atが空だとNG' do
      post = build(:post, studied_at: nil)
      post.valid?
      expect(post.errors[:studied_at]).to include("を入力してください")
    end

    it 'study_timeが空だとNG' do
      post = build(:post, study_time: nil)
      post.valid?
      expect(post.errors[:study_time]).to include("を入力してください")
    end

    it 'study_minutesが空だとNG' do
      post = build(:post, study_minutes: nil)
      post.valid?
      expect(post.errors[:study_minutes]).to include("を入力してください")
    end

    it 'contentが空だとNG' do
      post = build(:post, content: nil)
      post.valid?
      expect(post.errors[:content]).to include("を入力してください")
    end

    it 'study_methodが空だとNG' do
      post = build(:post, study_method: nil)
      post.valid?
      expect(post.errors[:study_method]).to include("を入力してください")
    end

    it 'titleが20文字以下だとOK' do
      post = build(:post, title: "あいうえおあいうえおあいうえおあいうえお")
      expect(post.valid?).to eq(true)
    end

    it 'titleが20文字以上だとNG' do
      post = build(:post, title: "あいうえおあいうえおあいうえおあいうえおあ")
      post.valid?
      expect(post.errors[:title][0]).to include("は20文字以内で入力してください")
    end

    it 'studied_atが8文字以上だとNG' do
      post = build(:post, studied_at: "201901011")
      post.valid?
      expect(post.errors[:studied_at][0]).to include("は8文字で入力してください")
    end

    it 'studied_atが8文字だとOK' do
      post = build(:post, studied_at: "20190101")
      expect(post.valid?).to eq(true)
    end

    it 'studied_atが8文字以下だとNG' do
      post = build(:post, studied_at: "201911")
      post.valid?
      expect(post.errors[:studied_at][0]).to include("は8文字で入力してください")
    end

    it "重複したstudied_atが存在するときNG" do
      post = create(:post)
      another_post = build(:post, studied_at: post.studied_at, user_id: 1)
      another_post.valid?
      expect(another_post.errors[:studied_at]).to include("はすでに存在します")
    end
  end
end
