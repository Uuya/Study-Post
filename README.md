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

## userテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|image|string||

### Association
- has_many :posts, dependent: :destroy

## postsテーブル

|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|studied_at|integer|null: false|
|study_time|integer|null: false|
|study_minutes|integer|null: false|
|content|string|null: false|
|study_method|string|null: false|
|reflection|string||
|next_study|string||
|other|string||
|user|reference|foreign_key: true

### Association
- belongs_to :user
