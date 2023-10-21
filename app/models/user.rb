class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # ニックネームのバリデーション
  validates :nickname, presence: true, length: { maximum: 40 }

  # パスワードのバリデーション
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :password, format: { with: PASSWORD_REGEX, message: 'には半角英数字両方を含めて設定してください' }

  # フルネーム(全角)のバリデーション
  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'には全角文字(漢字・ひらがな・カタカナ)を使用してください' } do
    validates :last_name
    validates :first_name
  end

  # フルネーム(全角カナ)のバリデーション
  with_options presence: true, format: { with: /\A[ァ-ヶー]+\z/, message: 'には全角文字(カタカナ)を使用してください' } do
    validates :last_name_kana
    validates :first_name_kana
  end

# 生年月日のバリデーション
  validates :date_of_birth, presence: true

end
