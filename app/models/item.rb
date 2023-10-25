class Item < ApplicationRecord
  # バリデーション
  validates :item_name,        presence: true  # 商品名

  validates :item_description, presence: true  # 商品の説明

  validates :category_id,      presence: true  # カテゴリー

  validates :condition_id,     presence: true  # 商品の状態

  validates :shipping_fee_id,  presence: true  # 配送料の負担

  validates :prefecture_id,    presence: true  # 発送元の地域

  validates :shipping_time_id, presence: true  # 発送までの日数

  validates :price,            presence: true, length: { in: 300..9999999 }, format: { with: /\A[0-9]+\z/, message: 'には半角数字を使用してください' }  # 価格

  # アソシエーション
  belongs_to :user

end
