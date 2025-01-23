# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


```markdown


### USERS テーブル
| Column               | Type           | Constraints                           |
|----------------------|----------------|---------------------------------------|
| nickname             | string         | null: false                           |
| email                | string         | null: false, unique: true             |
| encrypted_password   | string         | null: false                           |
| first_name           | string         | null: false                           |
| last_name            | string         | null: false                           |
| first_name_kana      | string         | null: false                           |
| last_name_kana       | string         | null: false                           |
| birth_date           | date           | null: false                           |

**アソシエーション**:
- `has_many :items`
- `has_many :purchases`


### ITEMS テーブル
| Column               | Type           | Constraints                  |
|----------------------|----------------|------------------------------|
| name                 | string         | null: false                  |
| description          | text           | null: false                  |
| price                | integer        | null: false                  |
| category_id          | integer        | null: false                  |
| condition_id         | integer        | null: false                  |
| shipping_fee_id      | integer        | null: false                  |
| region_id            | integer        | null: false                  |
| shipping_day_id      | integer        | null: false                  |
| user                 | references     | null: false, foreign_key: true |

**アソシエーション**:
- `belongs_to :user`
- `belongs_to :category`
- `belongs_to :condition`
- `belongs_to :shipping_fee`
- `belongs_to :region`
- `belongs_to :shipping_day`
- `has_one :purchase`



### PURCHASES テーブル
| Column               | Type           | Constraints                    |
|----------------------|----------------|--------------------------------|
| user                 | references     | null: false, foreign_key: true |
| item                 | references     | null: false, foreign_key: true |

**アソシエーション**:
- `belongs_to :user`
- `belongs_to :item`


### ADDRESSES テーブル
| Column               | Type           | Constraints          |
|----------------------|----------------|----------------------|
| purchase             | references     | null: false          |
| zip_code             | string         | null: false          |
| state                | string         | null: false          |
| city                 | string         | null: false          |
| address_line         | string         | null: false          |
| country              | string         | null: false          |
| region_id            | integer        | null: false          |

