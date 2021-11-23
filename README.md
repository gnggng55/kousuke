# 工助(kousuke)

## アプリケーション概要
工事の記録、工事までの事務作業をスムーズに行うことができるアプリケーションです。
物件での工事をする人を対象にしており、工事までに必要な事務作業、工事の記録を簡単に
行うことができます。1名から大人数使用できます。

## 本番環境



## 制作背景
前職では、住宅設備機器の販売、施工をする会社にいました。
以下3点課題を感じており、それを解決するために作成しています。
1. 同じこと繰り返すことがある
2. 会社に戻らないと登録できない情報がある
3. 情報を登録しないと、次の過程に進まないので仕事が遅れることがある

同じマンションで仕事で仕事をする際に、物件の写真や既存設置機種など、変わらない事であっても
部屋ごとに登録をしなければならず、同じ写真を撮る等の無駄な作業が起こっていました。
写真は会社にもどならければ登録できず、写真がなければ事務員さんが書類を作成できず、
登録されるまで、作業がストップすることがありました。
以上より、その課題を解決できるよう、このアプリケーションの開発に至りました。

## アプリケーションの機能一覧

- ユーザー管理機能
- 物件の登録機能
- 物件内の部屋情報登録機能
- 部屋情報削除機能
- 部屋情報登録機能
- 部屋情報削除機能
- 商品登録機能

## DEMO

#### トップページ
[![Image from Gyazo](https://i.gyazo.com/c779f445f1f273aea035c61e86e9641b.png)](https://gyazo.com/c779f445f1f273aea035c61e86e9641b)

アプリ名をクリックするとこのページに遷移します。
登録した物件が一覧で出るようになっています。

#### 物件・部屋情報詳細ページ
[![Image from Gyazo](https://i.gyazo.com/3243d6aec919bb4d594896cd475c91e4.gif)](https://gyazo.com/3243d6aec919bb4d594896cd475c91e4)

物件名をクリックすると、物件詳細ページに遷移します。
物件詳細ページでは部屋情報が一覧になっており、部屋番号をクリックすると
部屋情報詳細ページに遷移します。



## 実装予定
- 物件情報編集機能
- 物件検索機能
- 部屋情報登録機能
- アプローチ（コメント）機能
- 商品検索機能
- 見積もり作成機能
- 画像含め、その他カラムの保存



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
