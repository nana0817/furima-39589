require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it ''
      # nicknameとemail, password, password_confirmation, last_name, first_name, last_name_kana, first_name_kana, date_of_birthが存在すれば登録できる
    end

    context '新規登録できないとき' do
      # nicknameが空では登録できない
      # emailが空では登録できない
      # 重複したemailが存在する場合は登録できない
      # emailは@を含まないと登録できない
      # passwordが空では登録できない
      # passwordが5文字以下では登録できない
      # passwordが129文字以上では登録できない
      # passwordは半角英数字混合でなければ登録できない
      # passwordとpassword_confirmationが不一致では登録できない
      # last_nameが空では登録できない
      # last_nameは全角(漢字・ひらがな・カタカナ)でなければ登録できない
      # first_nameが空では登録できない
      # first_nameは全角(漢字・ひらがな・カタカナ)でなければ登録できない
      # last_name_kanaが空では登録できない
      # last_name_kanaは全角(カタカナ)でなければ登録できない
      # first_name_kanaが空では登録できない
      # first_name_kanaは全角(カタカナ)でなければ登録できない
      # date_of_birthが空では登録できない
    end
  end
end
