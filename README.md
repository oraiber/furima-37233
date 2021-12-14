## users テーブル

| Column                  | Type    | Options                   |
| ----------------------- | ------- | ------------------------- |
| email                   | string  | null: false, unique: true |
| encrypted_password      | string  | null: false               |
| nickname                | string  | null: false               |
| first_name              | string  | null: false               |
| family_name             | string  | null: false               |
| birth_day               | date    | null: false               |

has_many: items
has_many: comments
belongs_to: card
belongs_to: buyer

## cards テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| user_id     | references | null: false, foreign_key: true |
| card_id     |            | null: false                    |

belongs_to: user

## buyers テーブル
| Column        | Type       | Option                         |
| ------------- | ---------- | ------------------------------ |
| first_name    | string     | null: false                    |
| family_name   | string     | null: false                    |
| post_code     | string     | null: false                    |
| prefecture    | string     | null: false                    |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| building_name | string     | null: false                    |
| phone_number  | string     | null: false                    |
| user_id       | references | null: false, foreign_key: true |

belongs_to: user
belongs_to: item
has_many: orders

## orders テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| item_id | references | null: false, foreign_key: true |
| user_id | references | null: false, foreign_key: true |

belongs_to: buyer

## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | text       |                                |
| user_id | references | null: false, foreign_key: true |
| item_id | references | null: false, foreign_key: true |

belongs_to: user
belongs_to: item

## items テーブル

| Column          | Type       | Option
| --------------- | ---------- | ------------------------------ |
| product_name    | string     | null: false                    |
| price           | integer    | null: false                    |
| text            | text       | null: false                    |
| user_id         | references | null: false, foreign_key: true |

belongs_to: user
belongs_to: item_category
belongs_to: buyer
has_many: comments
has_many: categories

## categories テーブル

| Column          | Type    | Option  |
| --------------- | ------- | ------- |
| category_name   | integer |         |
| detail          | integer |         |

belongs_to: item

## item_categories テーブル

| Column          | Type       | Option
| --------------- | ---------- | ------------------------------ |
| item_id         | references | null: false                    |
| item_condition  | integer    | null: false                    |
| delivery_charge | integer    | null: false                    |
| area            | integer    | null: false                    |
| days            | integer    | null: false                    |

belongs_to: item