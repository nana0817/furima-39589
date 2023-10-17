# テーブル設計

## users テーブル

| Column                           | Type    | Options                   |
| -------------------------------- | ------- | ------------------------- |
| nickname                         | string  | null: false               |
| email                            | string  | null: false, unique: true |
| encrypted_password               | string  | null: false               |
| chinese_character_family_name    | string  | null: false               |
| chinese_character_first_name     | string  | null: false               |
| katakana_family_name             | string  | null: false               |
| katakana_first_name              | string  | null: false               |
| date_of_birth                    | date    | null: false               |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column                | Type        |  Options                       |
| --------------------- | ----------- | ------------------------------ |
| item_name                 | string      | null: false                    |
| item_description      | text        | null: false                    |
| category_id           | integer     | null: false                    |
| condition_id          | integer     | null: false                    |
| shipping_fee_id    | integer     | null: false                    |
| prefecture_id | integer     | null: false                    |
| shipping_time_id   | integer     | null: false                    |
| price              | integer     | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| user                | references | null: false, foreign_key: true |
| item                | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| post_code        | integer    | null: false                    |
| prefecture_id       | integer     | null: false                    |
| municipalities   | string     | null: false                    |
| street_address   | string     | null: false                    |
| building_name    | string     |                                |
| telephone_number | integer    | null: false                    |
| order            | references | null: false, foreign_key: true |

### Association

- belongs_to :order