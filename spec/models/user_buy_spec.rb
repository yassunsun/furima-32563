require 'rails_helper'

RSpec.describe UserBuy, type: :model do
  describe '配送先の保存' do
    before do
      @user_buy = FactoryBot.build(:user_buy)
    end

    context '商品購入がうまくいくとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@user_buy).to be_valid
      end
      it 'buildingは空でも保存できること' do
        @user_buy.building = nil
        expect(@user_buy).to be_valid
      end
    end

    context '商品購入がうまくいかないとき' do
      it 'tokenが空では登録できないこと' do
        @user_buy.token = nil
        @user_buy.valid?
        expect(@user_buy.errors.full_messages).to include("Token can't be blank")
      end
      it 'postal_codeが空だと保存できないこと' do
        @user_buy.postal_code = nil
        @user_buy.valid?
        expect(@user_buy.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeにハイフンがないと保存できないこと' do
        @user_buy.postal_code = '1234567'
        @user_buy.valid?
        expect(@user_buy.errors.full_messages).to include('Postal code Input correctly')
      end
      it 'postal_codeが三桁の数字ハイフン四桁の数字以外だと保存できないこと' do
        @user_buy.postal_code = '123-456'
        @user_buy.valid?
        expect(@user_buy.errors.full_messages).to include('Postal code Input correctly')
      end
      it 'postal_codeが全角数字だと保存できないこと' do
        @user_buy.postal_code = '１２３-４５６７'
        @user_buy.valid?
        expect(@user_buy.errors.full_messages).to include('Postal code Input correctly')
      end
      it 'prefecture_idが1だと保存できないこと' do
        @user_buy.prefecture_id = 1
        @user_buy.valid?
        expect(@user_buy.errors.full_messages).to include('Prefecture Select')
      end
      it 'cityが空だと保存できないこと' do
        @user_buy.city = nil
        @user_buy.valid?
        expect(@user_buy.errors.full_messages).to include("City can't be blank")
      end
      it 'house_numberが空だと保存できないこと' do
        @user_buy.house_number = nil
        @user_buy.valid?
        expect(@user_buy.errors.full_messages).to include("House number can't be blank")
      end
      it 'phone_numberが空だと保存できないこと' do
        @user_buy.phone_number = nil
        @user_buy.valid?
        expect(@user_buy.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが全角数字だと保存できないこと' do
        @user_buy.phone_number = '１２３４５６７８９'
        @user_buy.valid?
        expect(@user_buy.errors.full_messages).to include('Phone number Input only number')
      end
      it 'phone_numberが英字だと保存できないこと' do
        @user_buy.phone_number = 'abcdefg'
        @user_buy.valid?
        expect(@user_buy.errors.full_messages).to include('Phone number Input only number')
      end
      it 'phone_numberにハイフンがあると保存できないこと' do
        @user_buy.phone_number = '000-000-000'
        @user_buy.valid?
        expect(@user_buy.errors.full_messages).to include('Phone number Input only number')
      end
      it 'phone_numberが12桁以上だと保存できないこと' do
        @user_buy.phone_number = '000123456789'
        @user_buy.valid?
        expect(@user_buy.errors.full_messages).to include('Phone number Input only number')
      end
    end
  end
end
