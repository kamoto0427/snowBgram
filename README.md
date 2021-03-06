## アプリのガイドブック
snowBgramの機能について、スライド形式で詳細にまとまっています。

https://docs.google.com/presentation/d/11eFXED9P-yuz1althV31Z4uBGy-0nVR5uzUiYT0JKj0/edit#slide=id.g9aeb680ee7_0_267

<img width="1427" alt="スクリーンショット 2020-09-19 11 35 25" src="https://user-images.githubusercontent.com/64408070/93657258-4e94ad80-fa6c-11ea-8319-b13558412c62.png">
<img width="1429" alt="スクリーンショット 2020-09-19 11 35 39" src="https://user-images.githubusercontent.com/64408070/93657257-42105500-fa6c-11ea-8eba-2fa3b78734d1.png">

## いいね機能(非同期通信)
![demo](https://gyazo.com/fe9b62bb17520bbfe1a845387985b812/raw)

## 動的セレクトボックス
選択したsnowBによって、選択できるブランドが変化する。

例えば、ボードを選択すれば、選択できるブランドは、[BURTON,K2,SALOMON]など
ブーツであれば、選択できるブランドは、[BURTON,DEELUXE,FLUX]など
![demo](https://gyazo.com/bc13fff2159a547d1139800c5bf4c500/raw)
![demo](https://gyazo.com/4fe4e2b16512c800302a47bc3ca4c195/raw)

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
