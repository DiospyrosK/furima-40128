require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品出品できる場合' do
      it 'name、explanation、category_id、condition_id、shipping_area_id、shipping_date_id、shipping_price_id、price、imageが存在すれば出品できる' do
        expect(@item).to be_valid
      end
      it 'priceが300~9,999,999の半角数字であれば出品できる' do
        @item.price = '9999999'
        expect(@item).to be_valid
      end
      it 'category_idが1以外であれば出品できる' do
        @item.category_id = 2
        expect(@item).to be_valid
      end
      it 'shipping_price_idが1以外であれば出品できる' do
        @item.shipping_price_id = 2
        expect(@item).to be_valid
      end
      it 'shipping_area_idが1以外であれば出品できる' do
        @item.shipping_area_id = 2
        expect(@item).to be_valid
      end
      it 'shipping_price_idが1以外であれば出品できる' do
        @item.shipping_price_id = 2
        expect(@item).to be_valid
      end
    end
    context '商品出品できない場合' do
      it '画像なしでは出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'userが紐づいていないと出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
      it 'nameが空では出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'explanationが空では出品できない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it 'category_idが空では出品できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'category_idが1では出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end
      it 'condition_idが空では出品できない' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it 'condition_idが1では出品できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Condition must be other than 1')
      end
      it 'shipping_price_idが空では出品できない' do
        @item.shipping_price_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping price can't be blank")
      end
      it 'shipping_price_idが1では出品できない' do
        @item.shipping_price_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping price must be other than 1')
      end
      it 'shipping_area_idが空では出品できない' do
        @item.shipping_area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping area can't be blank")
      end
      it 'shipping_area_idが1では出品できない' do
        @item.shipping_area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping area must be other than 1')
      end
      it 'shipping_date_idが空では出品できない' do
        @item.shipping_date_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping date can't be blank")
      end
      it 'shipping_date_idが1では出品できない' do
        @item.shipping_date_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping date must be other than 1')
      end
      it 'priceが空では出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが300円未満だと出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be in 300..9999999')
      end
      it 'priceが9999999円を超えると出品できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be in 300..9999999')
      end
      it '価格に半角数字以外が含まれている場合は出品できない' do
        @item.price = '３００００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
    end
  end
end
