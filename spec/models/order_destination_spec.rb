require 'rails_helper'

RSpec.describe OrderDestination, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_destination = FactoryBot.build(:order_destination, user_id: user.id, item_id: item.id)
  end

  describe '配送先情報の保存' do
    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_destination).to be_valid
      end
      it 'user_idが空でなければ保存できる' do
        @order_destination.user_id = 1
        expect(@order_destination).to be_valid
      end
      it 'item_idが空でなければ保存できる' do
        @order_destination.item_id = 2
        expect(@order_destination).to be_valid
      end
      it 'post_codeが半角数字のハイフンを含んだ正しい形であれば保存できる' do
        @order_destination.post_code = '123-4567'
        expect(@order_destination).to be_valid
      end
      it 'shipping_area_idを選択していれば保存できる' do
        @order_destination.shipping_area_id = 2
        expect(@order_destination).to be_valid
      end
      it 'cityが空でなければ保存できる' do
        @order_destination.city = '札幌市'
        expect(@order_destination).to be_valid
      end
      it 'street_addressが空でなければ保存できる' do
        @order_destination.street_address = '東区1-2-3'
        expect(@order_destination).to be_valid
      end
      it 'buildingは空でも保存できること' do
        @order_destination.building = ''
        expect(@order_destination).to be_valid
      end
      it '電話番号が11桁かつハイフンなしであれば保存できる' do
        @order_destination.phone_number = '09012345678'
        expect(@order_destination).to be_valid
      end
      it '電話番号が10桁かつハイフンなしであれば保存できる' do
        @order_destination.phone_number = '0312345678'
        expect(@order_destination).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'user_idが空では保存できないこと' do
        @order_destination.user_id = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空では保存できないこと' do
        @order_destination.item_id = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Item can't be blank")
      end
      it 'post_codeが空では保存できないこと' do
        @order_destination.post_code = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeが半角数字のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_destination.post_code = '1234567'
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end
      it 'shipping_area_idを選択していないと保存できないこと' do
        @order_destination.shipping_area_id = 1
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Shipping area can't be blank")
      end
      it 'shipping_area_idが空では保存できないこと' do
        @order_destination.shipping_area_id = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Shipping area can't be blank")
      end
      it 'cityが空では保存できないこと' do
        @order_destination.city = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("City can't be blank")
      end
      it 'street_addressが空では保存できないこと' do
        @order_destination.street_address = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Street address can't be blank")
      end
      it 'phone_numberが空では保存できないこと' do
        @order_destination.phone_number = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが半角数字でないと保存できないこと' do
        @order_destination.phone_number = '０８０１２３４５６７８'
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include('Phone number is invalid')
      end
      it 'phone_numberが9桁以下では保存できないこと' do
        @order_destination.phone_number = '080123456'
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include('Phone number is invalid')
      end
      it 'phone_numberが12桁以上では保存できないこと' do
        @order_destination.phone_number = '080123456789'
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include('Phone number is invalid')
      end
      it 'phone_numberにハイフンがあると保存できないこと' do
        @order_destination.phone_number = '080-1234-5678'
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include('Phone number is invalid')
      end
      it 'tokenが空では保存できないこと' do
        @order_destination.token = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
