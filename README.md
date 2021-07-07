# README

## users テーブル

| Column             | Type    | Options                 |
| ------------------ | ------- | ----------------------- |
| nickname           | string  | null false              |
| email              | string  | null false,unique: true |
| encrypted_password | string  | null false              |
| last_name          | string  | null false              |
| first_name         | string  | null false              |
| last_name_kana     | string  | null false              |
| first_name_kana    | string  | null false              |
| birth_date         | data    | null false              |


### Association

- has_many :items
- has_many :comments
- has_many :managements

## items テーブル

| Column                  | Type          | Options           |
| ----------------------- | ------------- | ----------------- |
| name                    | string        | null false        |
| info                    | text          | null false        |
| category_id             | integer       | null false        |
| sales_status_id         | integer       | null false        |
| shipping_free_status_id | integer       | null false        |
| prefecture_id           | integer       | null false        |
| scheduled_delivery_id   | integer       | null false        |
| price                   | integer       | null false        |
| user                    | references    | foreign_key: true |

### Association

- belongs_to :user
- has_many :comments
- has_one  :management

## comments テーブル

| Column       | Type          | Options           |
| ------------ | ------------- | ----------------- |
| text         | string        | null false        |
| user         | references    | foreign_key: true |
| item         | references    | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## management テーブル

| Column      | Type       | Options           |
| ----------- | ---------- | ----------------- |
| user        | references | foreign_key: true |
| item        | references | foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :street_address

## street_address テーブル

| Column            | Type       | Options          |
| ----------------- | ---------- | ---------------- |
| postal_code       | string     | null false       |
| prefecture_       | integer    | null false       |
| city              | string     | null false       |
| addresses         | string     | null false       |
| building          | string     |                  |
| phone_number      | string     | null false       |
| management        | references | foreign_key: true|

- belongs_to :management

