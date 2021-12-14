## users テーブル

| Column                  | Type    | Options                   |
| ----------------------- | ------- | ------------------------- |
| email                   | string  | null: false, unique: true |
| encrypted_password      | string  | null: false               |
| nickname                | string  | null: false               |
| first_name              | string  | null: false               |
| family_name             | string  | null: false               |
| first_name_kana         | string  | null: false               |
| family_name_kana        | string  | null: false               |
| birth_day               | date    | null: false               |

has_many: items
has_many: orders

## addressesテーブル

| Column        | Type       | Option                         |
| ------------- | ---------- | ------------------------------ |
| post_code     | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| address1      | string     | null: false                    |
| building_name | string     | null: false                    |
| phone_number  | string     | null: false                    |

belongs_to: order

## orders テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| item    | references | null: false, foreign_key: true |
| user    | references | null: false, foreign_key: true |
| address | references | null: false, foreign_key: true |

belongs_to: item
has_one: address

## items テーブル

| Column             | Type       | Option
| ------------------ | ---------- | ------------------------------ |
| item_name          | string     | null: false                    |
| text               | text       | null: false                    |
| category_id        | integer    | null: false                    |
| item_condition_id  | integer    | null: false                    |
| delivery_charge_id | integer    | null: false                    |
| area_id            | integer    | null: false                    |
| days_id            | integer    | null: false                    |
| price              | string     | null: false                    |
| user               | references | null: false, foreign_key: true |

belongs_to: user
belongs_to: order