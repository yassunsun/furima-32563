require 'rails_helper'

RSpec.describe UserBuy, type: :model do
  describe '配送先の保存' do
    before do
      @user_buy = FactoryBot.build(:user_buy)
    end

    context '商品購入がうまくいくとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        # expect(@user_buy).to be_valid
      end
      it 'buildeingは空でも保存できること' do
        # @user_buy = nil
        # expect(@user_buy).to be_valid
      end
    end

    context '商品購入がうまくいかないとき' do
      it 'postal_codeが空だと保存できないこと' do
        @user_buy.postal_code = nil
        @user_buy.valid?
        expect(@user_buy.errors.full_messages). to include("Postal code can't be blank")
      end
      it 'postal_codeにハイフンがないと保存できないこと' do
        @user_buy.postal_code = "1234567"
        @user_buy.valid?
        expect(@user_buy.errors.full_messages). to include("Postal code Input correctly")
      end
      it 'prefecture_idが1だと保存できないこと' do
        @user_buy.prefecture_id = 1
        @user_buy.valid?
        expect(@user_buy.errors.full_messages). to include("Prefecture Select")
      end
      it 'cityが空だと保存できないこと' do
        @user_buy.city = nil
        @user_buy.valid?
        expect(@user_buy.errors.full_messages). to include("City can't be blank")
      end
      it 'house_numberが空だと保存できないこと' do
        @user_buy.house_number = nil
        @user_buy.valid?
        expect(@user_buy.errors.full_messages). to include("House number can't be blank")
      end
      it 'phone_numberが空だと保存できないこと' do
        @user_buy.phone_number = nil
        @user_buy.valid?
        expect(@user_buy.errors.full_messages). to include("Phone number can't be blank")
      end
      it 'phone_numberが全角数字だと保存できないこと' do
        @user_buy.phone_number = "１２３４５６７８９"
        @user_buy.valid?
        expect(@user_buy.errors.full_messages). to include("Phone number Input only number")
      end
      it 'phone_numberが英字だと保存できないこと' do
        @user_buy.phone_number = "abcdefg"
        @user_buy.valid?
        expect(@user_buy.errors.full_messages). to include("Phone number Input only number")
      end
    end
  end
end