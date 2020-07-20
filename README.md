# README

##snowBgramの機能について
snowBgramはスノボー版インスタグラムです。
おすすめのボードやブーツ、ビンディングなどをシェアができます。
スノーボードに特化させることで、全国のスノーボーダーたちのコミュニティになって欲しいという目的があります。

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null :false|
|profile|text||
|profile_image_id|string||
|email|string|null :false|
|password|string|null :false|

### Association
- has_many :posts, dependent: :destroy
- has_many :favorites, dependent: :destroy


## postsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null :false|
|title|string|null :false|
|body|text|null :false|
|image_id|string|null :false|

### Association
- belongs_to :user
- has_many :favorites, dependent: :destroy

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer||
|post_id|integer||
|text|text|null :false|

### Association
- belongs_to :user
- belongs_to :post


## favoritesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer||
|post_id|integer||

### Association
- belongs_to :user
- belongs_to :post