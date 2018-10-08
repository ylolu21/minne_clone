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


## 概要
個人の技術向上のために、既存のHPを複製してみる。




## DB

ユーザーテーブル
|Column|Type|Options|
|:--:|:--:|:--:|
|name|string|null: false|
|icon|string||
|favorite_image|string||
|homepage_url|string||
|blog_url|string||
|twitter_account|string||
|facebook_account|string||
instagram_account|string||
|mixi_account|string|

フォローテーブル
|Column|Type|Options|
|:--:|:--:|:--:|
|follow_id|reference|null: false, foreign_key: true|
|follower_id|reference|null: false, foreign_key: true|