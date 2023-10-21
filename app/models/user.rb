class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname,        presence: true, length: { maximum: 40 }
  # フルネーム(全角)のバリデーション
  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: '全角(漢字・ひらがな・カタカナ)のみが使えます' } do
    validates :last_name
    validates :first_name
  end
  # フルネーム(全角カナ)のバリデーション
  with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: '全角(カタカナ)のみが使えます' } do
    validates :last_name_kana
    validates :first_name_kana
  end
  
  validates :date_of_birth,   presence: true
end
