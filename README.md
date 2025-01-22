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

Here is the schema you provided in markdown format:

Here is the revised schema based on your preferences:

```markdown
### USERS
| Column               | Type           | Constraints                           |
|----------------------|----------------|---------------------------------------|
| nickname             | string         | null: false                           |
| email                | string         | null: false, unique: true             |
| encrypted_password   | string         | null: false                           |
| password_confirmation| string         | null: false                           |
| first_name           | string         | null: false                           |
| last_name            | string         | null: false                           |
| first_name_kana      | string         | null: false                           |
| last_name_kana       | string         | null: false                           |
| birth_date           | date           | null: false                           |

### ITEMS
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

### PURCHASES
| Column               | Type           | Constraints                                        |
|----------------------|----------------|----------------------------------------------------|
| buyer_id             | bigint         | null: false, foreign key references Users(id)      |
| item_id              | bigint         | null: false, foreign key references Items(id)      |

### ADDRESSES
| Column               | Type           | Constraints                                        |
|----------------------|----------------|----------------------------------------------------|
| purchase_id          | bigint         | null: false, foreign key references Purchases(id)  |
| zip_code             | string         | null: false                                        |
| state                | string         | null: false                                        |
| city                 | string         | null: false                                        |
| address_line         | string         | null: false                                        |
| country              | string         | null: false                                        |
