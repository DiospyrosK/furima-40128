## usersテーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| kana_last          | string | null: false               |
| kana_first         | string | null: false               |
| birthday           | date   | null: false               |


### Association
has_many :items
has_many :purchases


## itemsテーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| user              | references | null: false, foreign_key: true |
| name              | string     | null: false                    |
| explanation       | text       | null: false                    |
| category_id       | integer    | null: false                    |
| condition_id      | integer    | null: false                    |
| shipping_price_id | integer    | null: false                    |
| shipping_area_id  | integer    | null: false                    |
| shipping_date_id  | integer    | null: false                    |
| price             | integer    | null: false                    |


### Association
belongs_to :user
has_one :purchase


## purchasesテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |



### Association
belongs_to :user
belongs_to :item
has_one :destination


## destinationsテーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| purchase       | references | null: false, foreign_key: true |
| post_code      | string     | null: false                    |
| prefecture_id  | integer    | null: false                    |
| city           | string     | null: false                    |
| street_address | string     | null: false                    |
| building       | string     |                                |
| phone_number   | string     | null: false                    |


### Association
belongs_to :purchase