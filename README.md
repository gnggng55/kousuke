# 工助(kousuke)

## アプリケーション概要
### 対象者
  設備機器交換を仕事にしている方

### このアプリケーションでできること
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


## room テーブル

| Column               | Type       | Opinions                       |
| -------------------- | ---------- | ------------------------------ |
| room_number          | integer    | null: false                    | 
| construction_time_id | string     |                                |
| instructions         | integer    |                                |
| remarks_room         | string     |                                |
| construction_details | integer    |                                |
| property             | references | null; false, foreign_key: true |

### Association
- belongs_to :property
- has_many :approaches
- has_many :quotations



## approach テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null; false, foreign_key: true |
| room    | references | null: false, foreign_key: true | 
| content | text       | null; false                    |

### Association
belongs_to :user
belongs_to :room


## quotation

| Column | Type       | Opinions                       |
| ------ | ---------- | ------------------------------ |
| item   | references | null: false, foreign_key: true |
| free   | string     |                                |

### Association
has_many :items


## item
| Column         | Type       | Options     |
| -------------- | ---------- | ------------|
| item_name      | string     | null: false |
| product_number | string     | null: false |
| price          | integer    | null: false |
| rate           | integer    |             |
| gas_id         | integer    |             |

### Association
has_many :quotation
