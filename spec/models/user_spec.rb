require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nickname, email, password, password_confirmation, last_name_kanji, first_name_kanji, last_name_katakana, first_name_katakana, birthdayが存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "nicknameが存在すれば登録できる" do
        @user.nickname = "test"
        expect(@user).to be_valid
      end
      it "emailが存在すれば登録できる" do
        @user.email = "test@example"
        expect(@user).to be_valid
      end
      it "passwordが6文字以上であれば登録できる" do
        @user.password = "000000"
        expect(@user).to be_valid
      end
      it "password_confirmirtionが6文字以上であれば登録できる" do
        @user.password = "000000"
        @user.password_confirmation = "000000"
        expect(@user).to be_valid
      end
      it "last_name_kanjiが存在すれば登録できる" do
        @user.last_name_kanji = "安本"
        expect(@user).to be_valid
      end
      it "first_name_kanjiが存在すれば登録できる" do
        @user.first_name_kanji = "悠人"
        expect(@user).to be_valid
      end
      it "last_name_katakanaが存在すれば登録できる" do
        @user.last_name_katakana = "ヤスモト"
        expect(@user).to be_valid
      end
      it "first_name_katakanaが存在すれば登録できる" do
        @user.first_name_katakana = "ユウト"
        expect(@user).to be_valid
      end
      it "birthdayが存在すれば登録できる" do
        @user.birthday = "1998-07-13"
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
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
      it "first_name_katakanaが空では登録できない" do
        @user.first_name_katakana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "First name katakana can't be blank"
      end
      it "birthdayが空では登録できない" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Birthday can't be blank"
      end
    end
  end

end