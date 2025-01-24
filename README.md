#### **users テーブル**
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
- has_many :items
- has_many :purchases


#### **items テーブル**
| Column               | Type           | Constraints                  |
|----------------------|----------------|------------------------------|
| name                 | string         | null: false                  |
| description          | text           | null: false                  |
| price                | integer        | null: false                  |
| category_id          | integer        | null: false                  |
| condition_id         | integer        | null: false                  |
| shipping_fee_id      | integer        | null: false                  |
| prefecture_id        | integer        | null: false                  |
| shipping_day_id      | integer        | null: false                  |
| user                 | references     | null: false, foreign_key: true |

**アソシエーション**:
- belongs_to :user
- belongs_to :category
- belongs_to :condition
- belongs_to :shipping_fee
- belongs_to :region
- belongs_to :shipping_day
- has_one :purchase


#### **purchases テーブル**
| Column               | Type           | Constraints                    |
|----------------------|----------------|--------------------------------|
| user                 | references     | null: false, foreign_key: true |
| item                 | references     | null: false, foreign_key: true |

**アソシエーション**:
- belongs_to :user
- belongs_to :item
- has_one :address


#### **addresses テーブル**
| Column               | Type           | Constraints                    |
|----------------------|----------------|--------------------------------|
| purchase             | references     | null: false, foreign_key: true |
| zip_code             | string         | null: false                    |
| prefecture_id        | integer        | null: false                    |
| city                 | string         | null: false                    |
| address_line         | string         | null: false                    |
| building_name        | string         |                                |
| phone_number         | string         | null: false                    |

**アソシエーション**:
- belongs_to :purchase

