class Item < ApplicationRecord
  # アソシエーション
  belongs_to :user
  has_one :order

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :shipping_time

  has_one_attached :image

  # バリデーション
  validates :image,            presence: true                            # 商品の画像

  validates :item_name,        presence: true, length: { maximum: 40 }   # 商品名

  validates :item_description, presence: true, length: { maximum: 1000 } # 商品の説明

  with_options numericality: { other_than: 0, message: 'is invalid. Please select the appropriate value' } do
    validates :category_id       # カテゴリー

    validates :condition_id      # 商品の状態

    validates :shipping_fee_id   # 配送料の負担

    validates :prefecture_id     # 発送元の地域

    validates :shipping_time_id  # 発送までの日数
  end

  # 価格
  validates :price, presence: true
  validates :price, numericality: {
    allow_blank: true,
    only_integer: { message: 'is invalid. Input integer with half-width numbers' },
    greater_than_or_equal_to: 300,
    less_than_or_equal_to: 9_999_999
  }
end
