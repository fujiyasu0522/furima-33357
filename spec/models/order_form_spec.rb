require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  before do
    item = FactoryBot.create(:item)
    user = FactoryBot.create(:user)
    @order_form = FactoryBot.build(:order_form, item_id: item.id, user_id: user.id)
    sleep(1)
  end

    describe '購入情報の保存' do

      context '購入情報がうまくいく時' do
        it '全ての項目が入力されていれば購入ができる' do
          expect(@order_form).to be_valid
        end

        it '建物名が抜けていても登録できる' do
          @order_form.building = ""
          expect(@order_form).to be_valid
        end

        it '電話番号が10桁でも登録できる' do
          @order_form.phone_number = "1234567890"
          expect(@order_form).to be_valid
        end
      end

      context '購入情報がうまくいかない時' do
        it 'token(クレジットカード情報)が空だと購入ができない' do
          @order_form.token = nil
          @order_form.valid?
          expect(@order_form.errors.full_messages).to include()
        end

        it '郵便番号が空だと購入ができない' do
          @order_form.postal_code = ""
          @order_form.valid?
          expect(@order_form.errors.messages).to include({:postal_code => ["can't be blank", "is invalid"]})
        end

        it '郵便番号にハイフンがないと登録できない' do
          @order_form.postal_code = "1234567"
          @order_form.valid?
          expect(@order_form.errors.full_messages).to include("Postal code is invalid")
        end

        it '郵便番号が7桁でないと購入できない' do
          @order_form.postal_code = "123-458"
          @order_form.valid?
          expect(@order_form.errors.full_messages).to include("Postal code is invalid")
        end

        it 'delivery_area_idが空だと購入できない' do
          @order_form.delivery_area_id = nil
          @order_form.valid?
            expect(@order_form.errors.full_messages).to include("Delivery area can't be blank")
        end

        it 'delivery_area_idが0だと購入できない' do
          @order_form.delivery_area_id = 0
          @order_form.valid?
            expect(@order_form.errors.full_messages).to include("Delivery area must be other than 0")
        end

        it 'city_nameが空だと購入できない' do
          @order_form.city_name = ""
          @order_form.valid?
          expect(@order_form.errors.full_messages).to include("City name can't be blank")
        end

        it 'block_nameが空だと購入できない' do
          @order_form.block_name = ""
          @order_form.valid?
          expect(@order_form.errors.full_messages).to include("Block name can't be blank")
        end

        it 'phone_numberが空だと購入できない' do
          @order_form.phone_number = ""
          @order_form.valid?
          expect(@order_form.errors.full_messages).to include("Phone number can't be blank", "Phone number is invalid")
        end

        it 'phone_numberが11桁でなければ購入できない' do
          @order_form.phone_number = "123456789123"
          @order_form.valid?
          expect(@order_form.errors.full_messages).to include("Phone number is invalid")
        end

        it 'phone_numberが英数混合だと購入できない' do
          @order_form.phone_number = "abc12345678"
          @order_form.valid?
          expect(@order_form.errors.full_messages).to include("Phone number is invalid")
        end

        it 'user_idが空だと登録できない' do
          @order_form.user_id = ""
          @order_form.valid?
          expect(@order_form.errors.full_messages).to include("User can't be blank")
        end

        it 'item_idが空だと登録できない' do
          @order_form.item_id = ""
          @order_form.valid?
          expect(@order_form.errors.full_messages).to include("Item can't be blank")
        end
      end
    end
end