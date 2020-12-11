# テーブル設計

## users テーブル

| Column         | Type   | Options     |
| -------------- | ------ | ----------- |
| email          | string | null: false |
| password       | string | null: false |
| nickname       | string | null: false |
| name(kanji)    | string | null: false |
| name(katakana) | string | null: false |
| birthday       | date   | null: false |

### Association

- has_many :items
- has_many :buys
- has_one  :address


## items テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| title         | string     | null: false                    |
| explanation   | text       | null: false                    |
| category      | string     | null: false                    |
| condition     | string     | null: false                    |
| delivery_fee  | integer    | null: false                    |
| delivery_area | string     | null: false                    |
| delivery_day  | date       | null: false                    |
| price         | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :buy
- has_one    :address


## buys テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| card_number  | integer    | null: false                    |
| validity     | date       | null: false                    |
| cvc          | integer    | null: false                    |
| user         | references | null: false, foreign_key: true |
| item         | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :adress


## addresses テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| postal_code  | integer    | null: false                    |
| prefecture   | string     | null: false                    |
| city         | string     | null: false                    |
| house_number | integer    | null: false                    |
| building     | string     |                                |
| phone_number | integer    | null: false                    |
| user         | references | null: false, foreign_key: true |
| item         | references | null: false, foreign_key: true |
| buy          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- belongs_to :buy