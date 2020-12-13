require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it "nicknameが空だと登録できない" do
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end
    it "emailが空では登録できない" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end
    it "passwordが空では登録できない" do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Password can't be blank"
    end
    it "password_confirmationが空では登録できない" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end
    it "last_name_kanjiが空では登録できない" do
      @user.last_name_kanji = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name kanji can't be blank"
    end
    it "first_name_kanjiが空では登録できない" do
      @user.first_name_kanji = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kanji can't be blank"
    end
    it "last_name_katakanaが空では登録できない" do
      @user.last_name_katakana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name katakana can't be blank"
    end
    it "last_name_katakanaが空では登録できない" do
      @user.last_name_katakana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name katakana can't be blank"
    end
  end

end