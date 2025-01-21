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
| password      | VARCHAR(255)  | NOT NULL           |
| created_at    | TIMESTAMP     | DEFAULT CURRENT_TIMESTAMP |
| updated_at    | TIMESTAMP     | DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP |

### **Items Table**
| Column        | Type          | Constraints        |
|---------------|---------------|--------------------|
| id            | BIGINT        | PRIMARY KEY, AUTO_INCREMENT |
| name          | VARCHAR(255)  | NOT NULL           |
| description   | TEXT          |                    |
| price         | DECIMAL(10, 2)| NOT NULL           |
| category      | VARCHAR(255)  |                    |
| image_url     | TEXT          |                    |
| seller_id     | BIGINT        | FOREIGN KEY REFERENCES Users(id) |
| created_at    | TIMESTAMP     | DEFAULT CURRENT_TIMESTAMP |
| updated_at    | TIMESTAMP     | DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP |

### **Purchases Table**
| Column        | Type          | Constraints        |
|---------------|---------------|--------------------|
| id            | BIGINT        | PRIMARY KEY, AUTO_INCREMENT |
| buyer_id      | BIGINT        | FOREIGN KEY REFERENCES Users(id) |
| item_id       | BIGINT        | FOREIGN KEY REFERENCES Items(id) |
| purchase_date | TIMESTAMP     | DEFAULT CURRENT_TIMESTAMP |

### **Addresses Table**
| Column        | Type          | Constraints        |
|---------------|---------------|--------------------|
| id            | BIGINT        | PRIMARY KEY, AUTO_INCREMENT |
| purchase_id   | BIGINT        | FOREIGN KEY REFERENCES Purchases(id) |
| address_line  | TEXT          | NOT NULL           |
| city          | VARCHAR(255)  | NOT NULL           |
| zip_code      | VARCHAR(20)   | NOT NULL           |
| country       | VARCHAR(255)  | NOT NULL           |

