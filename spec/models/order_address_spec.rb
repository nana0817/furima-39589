require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    order = FactoryBot.create(:order)
    @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id, order_id: order.id)
  end

  context '入力内容に問題がない場合' do
    it 'すべての値が正しく入力されていれば購入できる' do
      expect(@order_address).to be_valid
    end
    it 'building_nameは空でも購入できる' do
      @order_address.building_name = ''
      expect(@order_address).to be_valid
    end
  end

  context '入力内容に問題がある場合' do
    it 'post_codeが空では購入できない' do
      @order_address.post_code = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Post code can't be blank")
    end
    it 'post_codeが数値のみでは購入できない' do
      @order_address.post_code = 1234567
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Post code は無効です。ハイフン(-)を含めてください。")
    end
    it 'prefecture_idを選択していなければ購入できない' do
      @order_address.prefecture_id = 0
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Prefecture に、適切な値を選択してください。")
    end
    it 'municipalitiesが空では購入できない' do
      @order_address.municipalities = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Municipalities can't be blank")
    end
    it 'street_addressが空では購入できない' do
      @order_address.street_address = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Street address can't be blank")
    end
    it 'telephone_numberが空では購入できない' do
      @order_address.telephone_number = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Telephone number can't be blank")
    end
    it 'telephone_numberが10桁未満では購入できない' do
      @order_address.telephone_number = Faker::Number.number(digits: 9)
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Telephone number は、10桁以上11桁以内で登録可能です。")
    end
    it 'telephone_numberが11桁を超過すると購入できない' do
      @order_address.telephone_number = Faker::Number.number(digits: 12)
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Telephone number は、10桁以上11桁以内で登録可能です。")
    end
    it 'telephone_numberが全角数字では購入できない' do
      @order_address.telephone_number = '０１２３４５６７８９'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Telephone number は、半角数値のみ登録可能です。")
    end
    it 'userが紐づいていないと購入できない' do
      @order_address.user_id = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("User can't be blank")
    end
    it 'itemが紐づいていないと購入できない' do
      @order_address.item_id = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Item can't be blank")
    end
    it 'orderが紐づいていないと購入できない' do
      @order_address.order_id = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Order can't be blank")
    end
  end
end