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

# ER図
USERS {
    string nickname null: false
    string email null: false, unique: true
    string encrypted_password null: false
    string password_confirmation null: false
    string first_name null: false
    string last_name null: false
    string first_name_kana null: false
    string last_name_kana null: false
    date birth_date null: false
}

ITEMS {
    string name null: false
    text description null: false
    integer price null: false
    integer category_id null: false, foreign key references Categories(id)
    integer condition_id null: false, foreign key references ItemConditions(id)
    integer shipping_fee_id null: false, foreign key references ShippingFees(id)
    integer region_id null: false, foreign key references Regions(id)
    integer shipping_days_id null: false, foreign key references ShippingDays(id)
    bigint user_id null: false, foreign key references Users(id)
    timestamp created_at default: CURRENT_TIMESTAMP
    timestamp updated_at default: CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
}

PURCHASES {
    bigint buyer_id null: false, foreign key references Users(id)
    bigint item_id null: false, foreign key references Items(id)
}

addresses {
    purchase_id: bigint, null: false, foreign key references purchases(id)
    zip_code: string, null: false   
    state: string, null: false      
    city: string, null: false       
    address_line: string, null: false 
    country: string, null: false     
}

USERS ||--o{ ITEMS : "has many"
    USERS ||--o{ PURCHASES : "has many"
    PURCHASES ||--o{ ADDRESSES : "has one"
    ITEMS ||--o{ PURCHASES : "has many"