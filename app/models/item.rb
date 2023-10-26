class Item < ApplicationRecord
  # バリデーション
  validates :item_name,        presence: true  # 商品名

  validates :item_description, presence: true  # 商品の説明

  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :category_id       # カテゴリー
    
    validates :condition_id      # 商品の状態

    validates :shipping_fee_id   # 配送料の負担

    validates :prefecture_id     # 発送元の地域

    validates :shipping_time_id  # 発送までの日数
  end

  validates :price,            presence: true, length: { in: 300..9999999 }, format: { with: /\A[0-9]+\z/, message: 'には半角数字を使用してください' }  # 価格


  # アソシエーション
  belongs_to :user
  belongs_to_active_hash :category, :condition, :shipping_fee, :prefecture, :shipping_time

end
