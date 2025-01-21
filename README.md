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


**Users Table**
| Column        | Type          | Constraints        |
|---------------|---------------|--------------------|
| id            | BIGINT        | PRIMARY KEY, AUTO_INCREMENT |
| name          | VARCHAR(255)  | NOT NULL           |
| email         | VARCHAR(255)  | NOT NULL, UNIQUE   |
| encrypted_password | VARCHAR(255) | NOT NULL        |
| created_at    | TIMESTAMP     | DEFAULT CURRENT_TIMESTAMP |
| updated_at    | TIMESTAMP     | DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP |


**Items Table**
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


**Purchases Table**
| Column        | Type          | Constraints        |
|---------------|---------------|--------------------|
| id            | BIGINT        | PRIMARY KEY, AUTO_INCREMENT |
| buyer_id      | BIGINT        | FOREIGN KEY REFERENCES Users(id) |
| item_id       | BIGINT        | FOREIGN KEY REFERENCES Items(id) |
| purchase_date | TIMESTAMP     | DEFAULT CURRENT_TIMESTAMP |


**Addresses Table**
| Column        | Type          | Constraints        |
|---------------|---------------|--------------------|
| id            | BIGINT        | PRIMARY KEY, AUTO_INCREMENT |
| purchase_id   | BIGINT        | foreign key references Purchases(id) |
| address_line  | VARCHAR(255)  | NOT NULL           |
| city          | VARCHAR(255)  | NOT NULL           |
| zip_code      | VARCHAR(10)   | NOT NULL           |
| country       | VARCHAR(255)  | NOT NULL           |


**Categories Table** 
| Column        | Type          | Constraints        |
|---------------|---------------|--------------------|
| id            | BIGINT        | PRIMARY KEY, AUTO_INCREMENT |
| name          | VARCHAR(255)  | NOT NULL           |


**ItemConditions Table**
| Column        | Type          | Constraints        |
|---------------|---------------|--------------------|
| id            | BIGINT        | PRIMARY KEY, AUTO_INCREMENT |
| name          | VARCHAR(255)  | NOT NULL           |

 **ShippingFees Table** 
| Column        | Type          | Constraints        |
|---------------|---------------|--------------------|
| id            | BIGINT        | PRIMARY KEY, AUTO_INCREMENT |
| name          | VARCHAR(255)  | NOT NULL           |


**Regions Table** 
| Column        | Type          | Constraints        |
|---------------|---------------|--------------------|
| id            | BIGINT        | PRIMARY KEY, AUTO_INCREMENT |
| name          | VARCHAR(255)  | NOT NULL           |


**ShippingDays Table** 
| Column        | Type          | Constraints        |
|---------------|---------------|--------------------|
| id            | BIGINT        | PRIMARY KEY, AUTO_INCREMENT |
| name          | VARCHAR(255)  | NOT NULL           |
