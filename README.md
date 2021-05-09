# README

## users テーブル

| Column             | Type   | Options    |
| ------------------ | ------ | ---------- |
| nickname           | string | null false |
| email              | string | null false |
| password           | string | null false |
| last_name          | string | null false |
| first_name         | string | null false |
| last_name_kana     | string | null false |
| first_name_kana    | string | null false |
| birth_date         | date   | null false |


### Association

- has_many :item
- has_many :comments
- has_many :managements

## items テーブル

| Column                    | Type          | Options    |
| ------------------------- | ------------- | ---------- |
| name                 | string        | null false |
| info                 | text          | null false |
| category             | string        | null false |
| sales_status         | string        | null false |
| shipping_free_status | string        | null false |
| prefecture           | integer       | null false |
| scheduled_delivery   | date          | null false |
| price                | integer       | null false |
| image                | ActiveStorage |            |
| user                      | references    |            |

### Association

- belongs_to :user
- has_many :comments
- has_one  :management

## comments テーブル

| Column     | Type          | Options    |
| ---------- | ------------- | ---------- |
| text       | string        | null false |
| user       | references    |            |
| prototype  | references    |            |

### Association

- belongs_to :user
- belongs_to :item

## management テーブル

| Column         | Type       | Options    |
| -------------- | ---------- | ---------- |
| user           | references |            |
| item           | references |            |
| street address | references |            |

### Association
- belongs_to :user
- belongs_to :item
- has_one :street address


## street address テーブル

| Column         | Type       | Options    |
| -------------- | ---------- | ---------- |
| prefecture     | integer    | null false |
| city           | string     | null false |
| addresses      | string     | null false |
| building       | string     |            |
| phone_number   | string     | null false |


### Association

- belongs_to :management
