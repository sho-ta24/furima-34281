require 'rails_helper'

RSpec.describe ManagementStreetAddress, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @management_street_address = FactoryBot.build(:management_street_address, user_id: user.id, item_id: item.id)
      sleep 0.1 
    end

    context '購入記録がで登録できる場合' do
      it '全ての値が正しく入力されていれば保存できる' do
        expect(@management_street_address).to be_valid
      end
      it '建物名が入力されていなくても保存できる' do
        @management_street_address.building = ''
        @management_street_address.valid?
        expect(@management_street_address).to be_valid
      end
    end

    context '購入記録が登録できない場合' do
      it '郵便番号が入力されていないと保存できない' do
        @management_street_address.postal_code = ''
        @management_street_address.valid?
        expect(@management_street_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号にハイフンがなければ保存できない' do
        @management_street_address.postal_code = '1111111'
        @management_street_address.valid?
        expect(@management_street_address.errors.full_messages).to include('Postal code is invalid')
      end
      it '都道府県が入力されていないと保存できない' do
        @management_street_address.prefecture_id = 1
        @management_street_address.valid?
        expect(@management_street_address.errors.full_messages).to include('Prefecture must be other than 1')
      end
      it '市町村が入力されていないと保存できない' do
        @management_street_address.city = ''
        @management_street_address.valid?
        expect(@management_street_address.errors.full_messages).to include("City can't be blank")
      end
      it '番地が入力されていないと保存できない' do
        @management_street_address.address = ''
        @management_street_address.valid?
        expect(@management_street_address.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が入力されていなければ保存できない' do
        @management_street_address.phone_number = ''
        @management_street_address.valid?
        expect(@management_street_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号はハイフンがあると保存できない' do
        @management_street_address.phone_number = '090-1234-1234'
        @management_street_address.valid?
        expect(@management_street_address.errors.full_messages).to include('Phone number is invalid')
      end
      it '電話番号が１１桁いないではないと保存できない' do
        @management_street_address.phone_number = '009012341234'
        @management_street_address.valid?
        expect(@management_street_address.errors.full_messages).to include('Phone number is invalid')
      end
      it 'User_idが空では保存できない' do
        @management_street_address.user_id = ''
        @management_street_address.valid?
        expect(@management_street_address.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空では保存できない' do
        @management_street_address.item_id = ''
        @management_street_address.valid?
        expect(@management_street_address.errors.full_messages).to include("Item can't be blank")
      end
      it 'tokenが空では登録できないこと' do
        @management_street_address.token = nil
        @management_street_address.valid?
        expect(@management_street_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
