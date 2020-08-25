<img width="1426" alt="スクリーンショット 2020-08-25 16 27 37" src="https://user-images.githubusercontent.com/64408070/91145240-19f13880-e6f0-11ea-9388-56d993724f38.png">

<img width="1422" alt="スクリーンショット 2020-08-25 16 28 40" src="https://user-images.githubusercontent.com/64408070/91145247-1cec2900-e6f0-11ea-976f-834208cfb4da.png">

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
- カテゴリー機能
- 動的セレクトボックスから検索

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

## categoryテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null :false|
|ancestry|string|null :false, index: true|

### Association
- has_many :post_category, dependent: :destroy
- has_many :posts, through: :post_category
- has_ancestry

## post_categoryテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|null :false, foreign_key: true|
|post|references|null :false, foreign_key: true|

### Association
- belongs_to :post
- belongs_to :category

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