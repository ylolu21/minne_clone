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
## DB
### usersテーブル
***
|Column|Type|Options|
|:--:|:--:|:--:|
|nickname|string|null: false, index: true|
|email|string|null: false|
|icon|string||
|favorite_image|string||
|homepage_url|string||
|blog_url|string||
|twitter_account|string||
|facebook_account|string||
|instagram_account|string||
|mixi_account|string|

#### Association
- has_many:follows
- has_many:carts
- has_many:likes
- has_many:products, through: :likes
- has_one:authors, dependent: :destroy


### followsテーブル
***
|Column|Type|Options|
|:--:|:--:|:--:|
|follow_id|reference|null: false, foreign_key: true|
|follower_id|reference|null: false, foreign_key: true|

#### Association
- belongs_to: users


### authorsテーブル
***
|Column|Type|Options|
|:--:|:--:|:--:|
|user_id|reference|null: false, foreign_key: true|
|first_name|string|null: false|
|last_name|string|null: false|
|first_name_kana|string|null: false|
|last_name_kana|string|null: false|
|phone|string|null: false|
|birth_year|int|null: false|
|birth_month|int|null: false|
|birth_day|int|null: false|
|jender|enum|null: false|
|postal_code|int|null: false|
|region|string|null: false|
|city|string|null: false|
|address|string|null: false|
|bank|string|null: false|
|bank_code|int|null: false|
|branch_name|string|null: false|
|branch_code|int|null: false|
|account_name|string|null: false|
|account_type|int|null: false|
|account_number|int|null: false|
|product_count|int|null: false|


#### Association
- belongs_to: users
- has_many: products


### productsテーブル
***
|Column|Type|Options|
|:--:|:--:|:--:|
|product_name|string|null: false, index: true|
|price|int|null: false|
|size|string|null: false|
|quantity|int|null: false|
|description|text||
|attention|text||
|publishing_status|int|null: false, default: 0, limit: 1|
|sales_status|int|null: false, default: 0, limit: 1|
|category_id|reference|null: false, foreign_key: true|
|author_id|reference|null: false, foreign_key: true|

#### Association
- belongs_to: authors, counter_cache: true
- belongs_to: categorys
- has_many: likes
- has_many: cart_products
- has_many: carts, through: :cart_products
- has_many: tag_products
- has_many: tags, through: :tag_products
- has_many: feature_products
- has_many: features, through: :feature_products


### likesテーブル
***
|Column|Type|Options|
|:--:|:--:|:--:|
|user_id|reference|null: false, foreign_key: true|
|product_id|reference|null: false, foreign_key: true|

#### Association
- belongs_to:user
- belongs_to:products

### cartsテーブル
***
|Column|Type|Options|
|:--:|:--:|:--:|
|total_price|int|null: false|
|user_id|reference|null: false, foreign_key: true|

#### Association
- belongs_to: users
- has_many: products, through: :cart_products
- has_many: cart_products

### cart_productsテーブル
***
|Column|Type|Options|
|:--:|:--:|:--:|
|product_id|reference|null: false, foreign_key: true|
|cart_id|reference|null: false, foreign_key: true|
|sales_volume|reference|null: false, foreign_key: true|

#### Association
- belongs_to: carts
- belongs_to: products

### categorysテーブル
***
|Column|Type|Options|
|:--:|:--:|:--:|
|category_code|int|null: false|
|category_path|string|null: false|
|name|string|null: false, index: true|

#### Association
- has_many: products

### tagsテーブル
***
|Column|Type|Options|
|:--:|:--:|:--:|
|name|string|null: false, index: true|

#### Association
- has_many: tag_products
- has_many: products, through: :tag_products

### tag_productsテーブル
***
|Column|Type|Options|
|:--:|:--:|:--:|
|product_id|reference|null: false, foreign_key: true|
|tag_id|reference|null: false, foreign_key: true|

#### Association
- belongs_to: products
- belongs_to: tags

### featureテーブル
***
|Column|Type|Options|
|:--:|:--:|:--:|
|name|string|null: false|

#### Association
- has_many: feature_products
- has_many: products, through: :feature_products


### feature_productsテーブル
***
|Column|Type|Options|
|:--:|:--:|:--:|
|product_id|reference|null: false, foreign_key: true|
|feature_id|reference|null: false, foreign_key: true|

#### Association
- belongs_to: products
- belongs_to: features
