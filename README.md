# DB 設計

## users table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| nick_name          | string              | null: false             |
| email              | string              | null: false             |
| password           | string              | null: false             |
| first_name         | string              | null: false             |
| last_name          | string              | null: false             |
| first_name_kana    | string              | null: false             |
| last_name_kana     | string              | null: false             |
| birthday           | date                | null: false             |


### Association

* has_many :purchasers
* has_many :items


## items table

| Column        | Type           | Options           |
|---------------|----------------|-------------------|
| image         | Active Storage | null: false       |
| name          | string         | null: false       |
| description   | text           | null: false       |
| category      | string         |                   |
| status        | string         | null: false       |
| delivery_cost | string         | null: false       |
| delivery_area | string         | null: false       |
| delivery_days | datetime       | null: false       |
| price         | integer        | null: false       |
| user          | references     | foreign_key: true |


### Association

- belongs_to :users
- has_one :purchasers


## purchasers table

| Column      | Type       | Options           |
|-------------|------------|-------------------|
| item        | references | foreign_key: true |
| user        | references | foreign_key: true |

### Association

- belongs_to :users
- belongs_to :items
- has_one :shippings


## shippings table

| Column       | Type       | Options           |
|--------------|------------|-------------------|
| post_number  | integer    | null: false       |
| prefecture   | string     | null: false       |
| city         | string     | null: false       |
| address      | integer    | null: false       |
| building     | string     | null: false       |
| phone_number | string     | null: false       |

### Association

- belongs_to :purchasers