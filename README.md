# 工助(kousuke)

## アプリケーション概要
### 対象者
  物件での工事を仕事にしている方

### このアプリケーションでできること
- 工事の記録、工事までの事務作業をスムーズに行うことができる

  #### ユーザー登録
  - 名前とメールアドレスを登録できる
  - あらゆる登録を誰がしたかがわかるようになる。

  #### 物件の登録
  - 物件の住所、どのような設備機器がついているのか、物件の最寄りの駐車場、物件の写真、備考が登録できる。
  - 一度行ったことのある物件の情報が記録されるので、次の提案、工事の注意点が一度その物件に行けばわかるようになる。
  - 登録した物件で情報があるので、次の提案がしやすくなる

  #### 部屋情報の登録
  - マンションであれば何号室か、工事の内容、備考を登録できる。
  - その部屋での工事前、工事後の写真、見積もり、コメントを確認できる

  #### 工事前、工事後の写真
  - 工事前、工事後などの写真を登録できる
  - どのような工事だったか、類似する工事の参考にすることができる。
  - 何か合った時に記録として見返せる

  #### コメントを登録できる
  - 部屋情報に紐づくコメントを残せる
  - あらゆる登録をした際に、記録を残すことで引き継ぎ等を容易にする

  #### 商品を登録できる
  - 設備機器の商品名、品番、金額、仕切りを登録できる
  - 同じ商品の情報を登録することで一度登録するだけで何度も使用ができる

  #### 簡易的な見積もりを作成できる
  - 登録した商品の金額と工事費を登録できる
  - 登録した商品の金額と工事費から、仕入れ金などから利益額を自動計算する


## 制作背景
前職では、住宅設備機器の販売、施工をする会社にいました。
同じマンションで仕事をしているのに、部屋ごとに物件の写真や、設備機器の写真を撮り、
部屋情報のいくつかを入力しなければならなかった。
同じ写真、同じ情報なのに、この前入力したのにというのがあり、それを解決するアプリケーションを
作ってみたいと思い、制作しています。



## users テーブル


| Column             | Type   | Opinions                  |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |

### Association
- has_many :properties
- has_many :approaches
- has_many :quotations


## properties テーブル

| Column               | Type    | Options     |
| -------------------- | ------- | ------------|
| property_name        | string  | null: false |
| address              | text    | null: false |
| existing_information | string  |             |
| new_information      | string  |             |
| remarks              | text    |             |
| parking_id           | integer |             |
| gas_id               | integer |             |

### Association
- has_many :rooms


## rooms テーブル

| Column               | Type       | Opinions                       |
| -------------------- | ---------- | ------------------------------ |
| room_number          | integer    | null: false                    | 
| construction_time_id | integer    |                                |
| instruction          | text       |                                |
| remarks_room         | text       |                                |
| construction_detail  | string     |                                |
| property             | references | null: false, foreign_key: true |

### Associations
- belongs_to :property
- has_many :approaches
- has_many :quotations



## approaches テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null; false, foreign_key: true |
| room    | references | null: false, foreign_key: true | 
| content | text       | null; false                    |

### Association
belongs_to :user
belongs_to :room


## quotations

| Column | Type       | Opinions                       |
| ------ | ---------- | ------------------------------ |
| item   | references | null: false, foreign_key: true |
| free   | string     |                                |

### Association
has_many :items


## items
| Column         | Type       | Options     |
| -------------- | ---------- | ------------|
| item_name      | string     | null: false |
| product_number | string     | null: false |
| price          | integer    | null: false |
| rate           | integer    |             |
| gas_id         | integer    |             |

### Association
has_many :quotation
