# README

## users テーブル

| Column             | Type   | Options  |
| ------------------ | ------ | -------- |
| nickname           | string | not null |
| email              | string | not null |
| password           | string | not null |
| last_name          | string | not null |
| first_name         | string | not null |
| last_name_kana     | string | not null |
| first_name_kana    | string | not null |
| user_birth_date_1i | date   | not null |
| user_birth_date_2i | date   | not null |
| user_birth_date_3i | date   | not null |

### Association

- has_many :item
- has_many :comments

## items テーブル

| Column                    | Type          | Options  |
| ------------------------- | ------------- | -------- |
| item_name                 | string        | not null |
| item_info                 | text          | not null |
| item_category             | string        | not null |
| item_sales_status         | string        | not null |
| item_shipping_free_status | string        | not null |
| item_prefecture           | string        | not null |
| item_scheduled_delivery   | date          | not null |
| item_price                | integer       | not null |
| item_image                | ActiveStorage |          |
| user                      | references    |          |

### Association

- belongs_to :user
- has_many :comments
- has_one  :buy

## comments テーブル

| Column     | Type          | Options  |
| ---------- | ------------- | -------- |
| text       | string        | not null |
| user       | references    |          |
| prototype  | references    |          |

### Association

- belongs_to :user
- belongs_to :item

## buy テーブル

| Column         | Type       | Options  |
| -------------- | ---------- | -------- |
| card_number    | integer    | not null |
| card_exp_month | integer    | not null |
| card_exp_year  | integer    | not null |
| card_cvc       | integer    | not null |
| postal_code    | string     | not null |
| prefecture     | string     | not null |
| city | date    | string     | not null |
| addresses      | string     | not null |
| building       | string     |          |
| phone_number   | string     | not null |
| item           | references |          |


### Association

- belongs_to :item
