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

### **Users Table**
| Column        | Type          | Constraints        |
|---------------|---------------|--------------------|
| id            | BIGINT        | PRIMARY KEY, AUTO_INCREMENT |
| name          | VARCHAR(255)  | NOT NULL           |
| email         | VARCHAR(255)  | NOT NULL, UNIQUE   |
| encrypted_password | VARCHAR(255) | NOT NULL        |
| created_at    | TIMESTAMP     | DEFAULT CURRENT_TIMESTAMP |
| updated_at    | TIMESTAMP     | DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP |

**アソシエーション:**
- 1ユーザーは複数のアイテムを出品できる。 (`has_many :items`)
- 1ユーザーは複数の購入履歴を持つ。 (`has_many :purchases`)
- 1ユーザーは複数の配送先情報を持つ。 (`has_many :addresses`)


### **Items Table**
| Column        | Type          | Constraints        |
|---------------|---------------|--------------------|
| id            | BIGINT        | PRIMARY KEY, AUTO_INCREMENT |
| name          | VARCHAR(255)  | NOT NULL           |
| description   | TEXT          | NOT NULL           |
| price         | INTEGER       | NOT NULL           |
| category_id   | INTEGER       | NOT NULL, foreign key references Categories(id) |
| condition_id  | INTEGER       | NOT NULL, foreign key references ItemConditions(id) |
| shipping_fee_id | INTEGER     | NOT NULL, foreign key references ShippingFees(id) |
| region_id     | INTEGER       | NOT NULL, foreign key references Regions(id) |
| shipping_days_id | INTEGER    | NOT NULL, foreign key references ShippingDays(id) |
| user_id       | BIGINT        | FOREIGN KEY REFERENCES Users(id) |
| created_at    | TIMESTAMP     | DEFAULT CURRENT_TIMESTAMP |
| updated_at    | TIMESTAMP     | DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP |

**アソシエーション:**
- 1アイテムは1ユーザー（出品者）に関連付けられる。 (`belongs_to :user`)
- 1アイテムは1カテゴリに関連付けられる。 (`belongs_to :category`)
- 1アイテムは1商品の状態に関連付けられる。 (`belongs_to :condition`)
- 1アイテムは1つの配送料負担に関連付けられる。 (`belongs_to :shipping_fee`)
- 1アイテムは1つの発送元地域に関連付けられる。 (`belongs_to :region`)
- 1アイテムは1つの発送までの日数に関連付けられる。 (`belongs_to :shipping_day`)
- 1アイテムは複数の購入履歴を持つ。 (`has_many :purchases`)


### **Purchases Table**
| Column        | Type          | Constraints        |
|---------------|---------------|--------------------|
| id            | BIGINT        | PRIMARY KEY, AUTO_INCREMENT |
| buyer_id      | BIGINT        | FOREIGN KEY REFERENCES Users(id) |
| item_id       | BIGINT        | FOREIGN KEY REFERENCES Items(id) |
| purchase_date | TIMESTAMP     | DEFAULT CURRENT_TIMESTAMP |
**アソシエーション:**
- 1購入は1ユーザー（購入者）に関連付けられる。 (`belongs_to :buyer, class_name: 'User'`)
- 1購入は1アイテムに関連付けられる。 (`belongs_to :item`)
- 1購入は複数の配送先を持つことができる。 (`has_many :addresses`)


### **Addresses Table**
| Column        | Type          | Constraints        |
|---------------|---------------|--------------------|
| id            | BIGINT        | PRIMARY KEY, AUTO_INCREMENT |
| purchase_id   | BIGINT        | foreign key references Purchases(id) |
| address_line  | VARCHAR(255)  | NOT NULL           |
| city          | VARCHAR(255)  | NOT NULL           |
| zip_code      | VARCHAR(10)   | NOT NULL           |
| country       | VARCHAR(255)  | NOT NULL           |

**アソシエーション:**
- 1配送先は1購入に関連付けられる。 (`belongs_to :purchase`)


### **Categories Table** 
| Column        | Type          | Constraints        |
|---------------|---------------|--------------------|
| id            | BIGINT        | PRIMARY KEY, AUTO_INCREMENT |
| name          | VARCHAR(255)  | NOT NULL           |

**アソシエーション:**
- 1カテゴリは複数のアイテムに関連付けられる。 (`has_many :items`)


### **ItemConditions Table** 
| Column        | Type          | Constraints        |
|---------------|---------------|--------------------|
| id            | BIGINT        | PRIMARY KEY, AUTO_INCREMENT |
| name          | VARCHAR(255)  | NOT NULL           |

**アソシエーション:**
- 1商品の状態は複数のアイテムに関連付けられる。 (`has_many :items`)


### **ShippingFees Table** 
| Column        | Type          | Constraints        |
|---------------|---------------|--------------------|
| id            | BIGINT        | PRIMARY KEY, AUTO_INCREMENT |
| name          | VARCHAR(255)  | NOT NULL           |

**アソシエーション:**
- 1配送料の負担は複数のアイテムに関連付けられる。 (`has_many :items`)

---

### **Regions Table** 
| Column        | Type          | Constraints        |
|---------------|---------------|--------------------|
| id            | BIGINT        | PRIMARY KEY, AUTO_INCREMENT |
| name          | VARCHAR(255)  | NOT NULL           |

**アソシエーション:**
- 1地域は複数のアイテムに関連付けられる。 (`has_many :items`)

---

### **ShippingDays Table** 
| Column        | Type          | Constraints        |
|---------------|---------------|--------------------|
| id            | BIGINT        | PRIMARY KEY, AUTO_INCREMENT |
| name          | VARCHAR(255)  | NOT NULL           |

**アソシエーション:**
- 1発送までの日数は複数のアイテムに関連付けられる。 (`has_many :items`)
