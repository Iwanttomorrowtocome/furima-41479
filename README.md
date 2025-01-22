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
- `has_many :addresses, through: :purchases`

### ITEMS テーブル
| Column               | Type           | Constraints                                        |
|----------------------|----------------|----------------------------------------------------|
| name                 | string         | null: false                                        |
| description          | text           | null: false                                        |
| price                | integer        | null: false                                        |
| category_id          | integer        | null: false, foreign key references Categories(id) |
| condition_id         | integer        | null: false, foreign key references ItemConditions(id) |
| shipping_fee_id      | integer        | null: false, foreign key references ShippingFees(id) |
| region_id            | integer        | null: false, foreign key references Regions(id)     |
| shipping_days_id     | integer        | null: false, foreign key references ShippingDays(id)|
| user_id              | bigint         | null: false, foreign key references Users(id)      |

**アソシエーション**:
- `belongs_to :user`
- `belongs_to :category`
- `belongs_to :condition`
- `belongs_to :shipping_fee`
- `belongs_to :region`
- `belongs_to :shipping_day`
- `has_many :purchases`
- `has_many :addresses, through: :purchases`

### PURCHASES テーブル
| Column               | Type           | Constraints                                        |
|----------------------|----------------|----------------------------------------------------|
| buyer_id             | bigint         | null: false, foreign key references Users(id)      |
| item_id              | bigint         | null: false, foreign key references Items(id)      |

**アソシエーション**:
- `belongs_to :user`
- `belongs_to :item`
- `has_one :address`

### ADDRESSES テーブル
| Column               | Type           | Constraints                                        |
|----------------------|----------------|----------------------------------------------------|
| purchase_id          | bigint         | null: false, foreign key references Purchases(id)  |
| zip_code             | string         | null: false                                        |
| state                | string         | null: false                                        |
| city                 | string         | null: false                                        |
| address_line         | string         | null: false                                        |
| country              | string         | null: false                                        |
| region_id            | integer        | null: false, foreign key references Regions(id)     |

**アソシエーション**:
- `belongs_to :purchase`
- `belongs_to :user, through: :purchase`

