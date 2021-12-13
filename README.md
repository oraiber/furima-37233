## users テーブル

| Column                  | Type    | Options     |
| ----------------------- | ------- | ----------- |
| email                   | string  | null: false |
| encrypted_password      | string  | null: false |
| nickname                | string  | null: false |
| first_name              | string  | null: false |
| family_name             | string  | null: false |
| birth_day               | date    | null: false |

has_many: items
has_many: comments

## card テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| user_id     | references | null: false, foreign_key: true |
| card_id     |            | null: false                    |
| customer_id |            | null: false                    |

belongs_to: user

## buyer テーブル
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
| price           | string     | null: false                    |
| text            | text       | null: false                    |
| image           |            |                                |
| user_id         | references | null: false, foreign_key: true |
| item_condition  | string     | null: false                    |
| delivery_charge | string     | null: false                    |
| area            |            | null: false                    |
| days            |            | null: false                    |

belongs_to: user
has_many: comments
has_many: categories

## category テーブル

| Column          | Type  | Option  |
| --------------- | ----- | ------- |
| category_name   |       |         |
| detail          |       |         |

belongs_to: item