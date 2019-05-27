# DB設計

## users table

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, index: true|
|email|string|null: false|

### Association
- has_many :messages
***

## messages table

|Column|Type|Options|
|------|----|-------|
|body|text|-|
|picture|string|-|
|user_id|references|foreign_key: true|

### Association
- belongs_to :user
