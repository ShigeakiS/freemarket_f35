# README


## users table

|Column|Type|Options|
|------|----|-------|
|family_name|string|null: false|
|first_name|string|null: false|
|family_name_kana|string|null: false|
|first_name_kana|string|null: false|
|birth_year|integer| |
|birth_month|integer| |
|birth_day|integer| |
|email|string|null: false, unique: true|
|password|string|null: false|
|phone_number|integer| |
|nickname|string|null: false|
|avatar|string| |
|introduction|text| |

### Association
- has_many :items
- has_many :comments
- has_many :orders
- has_one :address
- has_one :credit_card


## addresses table

|Column|Type|Options|
|------|----|-------|
|postal_code|integer|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|street_number|string|null: false|
|building_name|string| |
|user_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user


## creditcards table

|Column|Type|Options|
|------|----|-------|
|number|integer|null: false, unique: true|
|security_code|integer|null: false|
|expiration_month|integer|null: false|
|expiration_year|integer|null: false|
|user_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user


## comments table

|Column|Type|Options|
|------|----|-------|
|comment|text|null: false|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item


## orders table

|Column|Type|Options|
|------|----|-------|
|status|integer|null: false|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item


## items table

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|price|integer|null: false|
|description|text||
|condition|string|null: false|
|shipping_from|string|null: false|
|shipping_date|integer|null: false|
|shipping_fee|integer|null: false|
|shipping_way|string|null: false|
|size|string|null: false|
|user_id|references|null: false, foreign_key: true|
|brand_id|references|null: false, foreign_key: true|
|bottom_category_id|references|null: false, foreign_key: true|

### Association
- has_many :images
- has_many :comments
- belongs_to :user
- belongs_to :bottom_category
- belongs_to :brand
- has_one :order


## images table

|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|item_id|references|null: false, foreign_key: true|

### Association
- belongs_to :item


## bottom_categories table
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|mid_caregory_id|references|null: false,foreign_key: true|

### Association
- has_many :items
- belongs_to :mid_category


## mid_categories table
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|top_categories_id|references|null: false,foreign_key: true|

### Association
- has_many :bottoms_categories
- belongs_to :top_category


## top_categories table
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :mid_categories


## brands table

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :items


