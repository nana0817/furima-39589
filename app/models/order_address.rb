class OrderAddress
  include ActiveModel::Model # モデルの一部機能(form_withメソッドに対応する機能とバリデーションを行う機能)を、作成したクラスに持たせる
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :municipalities, :street_address, :building_name, 
                :telephone_number, :order_id # 保存したいカラム名を属性値として扱えるようにする
  
  # バリデーション
  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "は無効です。ハイフン(-)を含めてください。" }
    validates :municipalities
    validates :street_address
    validates :order_id
  end
  validates :telephone_number, numericality: { only_integer: true, message: "は、半角数値のみ登録可能です。" }, 
                               length: { in: 10..11, message: "は、10桁以上11桁以内で登録可能です。" }
  validates :prefecture_id, numericality: { other_than: 0, message: "に、適切な値を選択してください。" }

  # データをテーブルに保存する処理
  def save
    # 購入情報を保存し、変数orderに代入する
    order = Order.create(user_id: user_id, item_id: item_id)
    # 住所を保存し、order_idには、変数orderのidと指定する
    Address.create(post_code: post_code, prefecture_id: prefecture_id, municipalities: municipalities, 
                   street_address: street_address, building_name: building_name, telephone_number: telephone_number, 
                   order_id: order.id)
  end
end
