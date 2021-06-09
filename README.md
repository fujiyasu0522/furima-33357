# DB 設計

## users table

| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| nick_name          | string              | null: false               |
| email              | string              | null: false, unique: true |
| encrypted_password | string              | null: false               |
| first_name         | string              | null: false               |
| last_name          | string              | null: false               |
| first_name_kana    | string              | null: false               |
| last_name_kana     | string              | null: false               |
| birthday           | date                | null: false               |


### Association

* has_many :purchasers
* has_many :items


## items table

| Column           | Type           | Options           |
|------------------|----------------|-------------------|
| item_name        | string         | null: false       |
| description      | text           | null: false       |
| category_id      | integer        | null: false       |
| status_id        | integer        | null: false       |
| delivery_cost_id | integer        | null: false       |
| delivery_area_id | integer        | null: false       |
| delivery_days_id | integer        | null: false       |
| price            | integer        | null: false       |
| user             | references     | foreign_key: true |


### Association

- belongs_to :user
- has_one :order


## order table

| Column      | Type       | Options           |
|-------------|------------|-------------------|
| item        | references | foreign_key: true |
| user        | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :order

## address table

| Column           | Type       | Options           |
|------------------|------------|-------------------|
| postal_code      | string     | null: false       |
| delivery_area_id | integer    | null: false       |
| city_name        | string     | null: false       |
| block_name       | string     | null: false       |
| building         | string     |                   |
| phone_number     | string     | null: false       |
| order            | references | foreign_key: true |

### Association

- belongs_to :order