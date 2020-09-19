## snowBgramってどんなwebアプリ？
snowBgramはスノボー版インスタグラムです。
おすすめのボードやブーツ、ビンディングなどをシェアができます。
スノーボードに特化させることで、全国のスノーボーダーたちのコミュニティになって欲しいという目的があります。

## snowBgramの機能
- ユーザー新規登録/ログイン
- マイページ
- snowBの投稿
- snowBの詳細/編集/削除
- コメント投稿
- いいね(非同期通信)
- パンくず

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
- has_many :comments


## postsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null :false|
|title|string|null :false|
|appeal|text|null :false|
|image_id|string|null :false|
|category_id|integer||

### Association
- belongs_to :user
- attachment :image
- belongs_to :user
- has_many :favorites, dependent: :destroy
- has_many :comments

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null :false|
|post_id|integer|null :false|
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