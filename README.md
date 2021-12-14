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
| phone_number            | string  | null: false               |
| birth_day               | date    | null: false               |

has_many: items
has_many: comments
has_many: orders
belongs_to: card
belongs_to: residence
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
| user          | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |
| residence     | references | null: false, foreign_key: true |

belongs_to: item
belongs_to: residence
belongs_to: user

## residencesテーブル

| Column        | Type       | Option                         |
| ------------- | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| post_code     | string     | null: false                    |
| prefecture    | string     | null: false                    |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| building_name | string     |                                |

belongs_to: user
belongs_to: buyer

## orders テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| item    | references | null: false, foreign_key: true |
| user    | references | null: false, foreign_key: true |

belongs_to: users
belongs_to: item

## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | text       |                                |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

belongs_to: user
belongs_to: item

## items テーブル

| Column          | Type       | Option
| --------------- | ---------- | ------------------------------ |
| product_name    | string     | null: false                    |
| price           | integer    | null: false                    |
| text            | text       | null: false                    |
| user            | references | null: false, foreign_key: true |
| category        | references | null: false                    |
| item_condition  | integer    | null: false                    |
| delivery_charge | integer    | null: false                    |
| area            | integer    | null: false                    |
| days            | integer    | null: false                    |

belongs_to: user
belongs_to: buyer
belongs_to: order
has_many: comments