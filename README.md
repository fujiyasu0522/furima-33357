# DB 設計

## users table

| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| nick_name          | string              | null: false               |
| email              | string              | null: false, unique: true |
| encrypted_password | string              | null: false               |
| first_name         | string              | null: false               |
| last_name          | string              | null: false             |
| first_name_kana    | string              | null: false             |
| last_name_kana     | string              | null: false             |
| birthday           | date                | null: false             |


### Association

* has_many :purchasers
* has_many :items


## items table

| Column           | Type           | Options           |
|------------------|----------------|-------------------|
| name             | string         | null: false       |
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
- has_one :purchaser


## purchasers table

| Column      | Type       | Options           |
|-------------|------------|-------------------|
| item        | references | foreign_key: true |
| user        | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping


## shippings table

| Column           | Type       | Options           |
|------------------|------------|-------------------|
| post_number      | string     | null: false       |
| delivery_area_id | integer    | null: false       |
| city             | string     | null: false       |
| address          | string     | null: false       |
| building         | string     |                   |
| phone_number     | string     | null: false       |
| purchaser        | references | foreign_key: true |

### Association

- belongs_to :purchaser