require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品出品がうまくいくとき' do
      it 'image, title, explanation, category_id, condition_id, fee_id, prefecture_id, day_id, priceが存在すれば出品できる' do
        expect(@item).to be_valid
      end
      it '画像が存在すれば出品できる' do
        @item.image = fixture_file_upload('public/images/test_image.png')
        expect(@item).to be_valid
      end
      it '商品名が存在すれば出品できる' do
        @item.title = 'テスト'
        expect(@item).to be_valid
      end
      it '商品の説明が存在すれば出品できる' do
        @item.explanation = 'テストです'
        expect(@item).to be_valid
      end
      it 'カテゴリーが存在すれば出品できる' do
        @item.category_id = 2
        expect(@item).to be_valid
      end
      it '商品の状態が存在すれば出品できる' do
        @item.condition_id = 2
        expect(@item).to be_valid
      end
      it '配送料の負担が存在すれば出品できる' do
        @item.fee_id = 2
        expect(@item).to be_valid
      end
      it '発送元の地域が存在すれば出品できる' do
        @item.prefecture_id = 2
        expect(@item).to be_valid
      end
      it '発送までの日数が存在すれば出品できる' do
        @item.day_id = 2
        expect(@item).to be_valid
      end
      it '販売価格が存在すれば出品できる' do
        @item.price = 2000
        expect(@item).to be_valid
      end
    end

    context '商品出品がうまくいかないとき' do
      it 'imageが空だと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'titleが空だと出品できない' do
        @item.title = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end
      it 'explanationが空だと出品できない' do
        @item.explanation = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it 'category_idが1の場合出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category Select')
      end
      it 'condition_idが1の場合出品できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Condition Select')
      end
      it 'fee_idが1の場合出品できない' do
        @item.fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Fee Select')
      end
      it 'prefecture_idが1の場合出品できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture Select')
      end
      it 'day_idが1の場合出品できない' do
        @item.day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Day Select')
      end
      it 'priceが空だと出品できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが半角数字以外だと出品できない' do
        @item.price = '２０００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Half-width number')
      end
      it 'priceが半角英数字の混合だと出品できない' do
        @item.price = '500aaa'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Half-width number')
      end
      it 'priceが半角英語だと出品できない' do
        @item.price = 'aaaa'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Half-width number')
      end
      it 'priceが¥299以下だと出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Out of setting range')
      end
      it 'priceが¥10,000,000以上だと出品できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Out of setting range')
      end
    end
  end
end
