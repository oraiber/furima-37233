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
belongs_to: address

## addressesテーブル

| Column        | Type       | Option                         |
| ------------- | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| post_code     | string     | null: false                    |
| prefecture    | string     | null: false                    |
| city          | string     | null: false                    |
| address1      | string     | null: false                    |
| building_name | string     |                                |

belongs_to: user
belongs_to: order

## orders テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| item    | references | null: false, foreign_key: true |
| user    | references | null: false, foreign_key: true |
| address | references | null: false, foreign_key: true |

belongs_to: users
belongs_to: item
belongs_to: address

## items テーブル

| Column          | Type       | Option
| --------------- | ---------- | ------------------------------ |
| item_name       | string     | null: false                    |
| text            | text       | null: false                    |
| category        | references | null: false                    |
| item_condition  | integer    | null: false                    |
| delivery_charge | integer    | null: false                    |
| area            | integer    | null: false                    |
| days            | integer    | null: false                    |
| price           | integer    | null: false                    |
| user            | references | null: false, foreign_key: true |

belongs_to: user
belongs_to: order