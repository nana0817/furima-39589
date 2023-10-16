# テーブル設計

## users テーブル

| Column                        | Type    | Options                   |
| ----------------------------- | ------- | ------------------------- |
| nickname                      | string  | null: false               |
| email                         | string  | null: false, unique: true |
| password                      | string  | null: false               |
| password_confirmation         | string  | null: false               |
| Chinese_character_family_name | string  | null: false               |
| Chinese_character_first_name  | string  | null: false               |
| Katakana_family_name          | string  | null: false               |
| Katakana_first_name           | string  | null: false               |
| birth_year                    | integer | null: false               |
| birth_month                   | integer | null: false               |
| birth_date                    | integer | null: false               |

### Association

- has_many :items
- has_one :order
- has_one :address

## items テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| title           | string     | null: false                    |
| text            | text       | null: false                    |
| category        | string     | null: false                    |
| condition       | string     | null: false                    |
| shipping_cost   | string     | null: false                    |
| shipping_source | string     | null: false                    |
| shipping_days   | string     | null: false                    |
| price           | integer    | null: false                    |
| user_id         | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| user_id             | references | null: false, foreign_key: true |
| item_id             | references | null: false, foreign_key: true |
| address_id          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- belongs_to :address

## addresses テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| post_code        | integer    | null: false                    |
| prefecture       | string     | null: false                    |
| municipalities   | string     | null: false                    |
| street_address   | string     | null: false                    |
| building_name    | string     |                                |
| telephone_number | integer    | null: false                    |
| user_id          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order