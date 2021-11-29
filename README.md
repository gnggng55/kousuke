## アプリケーション名
工助(kousuke)


## アプリケーション概要
工事の記録、工事までの事務作業をスムーズに行うことができるアプリケーションです。
物件での工事をする人を対象にしており、工事までに必要な事務作業、工事の記録を簡単に
行うことができます。1名から大人数使用できます。

## 本番環境
URL：https://kousuke.herokuapp.com/
       ID：tech  PASS：kkkk


## 制作背景
前職では、住宅設備機器の販売・施工をする会社に在籍しておりました。
以下3点課題を感じており、それを解決するために作成しています。
1. 同じこと繰り返すことがある
2. 会社に戻らないと登録できない情報がある
3. 情報を登録しないと、次の過程に進まないので仕事が遅れることがある

同じマンションで仕事で仕事をする際、物件の写真や既存設置機種など、変わらない情報であっても
部屋ごとに登録をしなければならず、同じ写真を撮る等の無駄な作業が起こっていました。
写真は会社に戻らなければ登録できませんでした。写真がなければ事務員さんが書類を作成できず、
登録されるまで作業がストップすることがありました。
以上より、その課題を解決できるようこのアプリケーションの開発に至りました。

## アプリケーションの機能一覧

- ユーザー管理機能
- 物件の登録機能
- 物件検索機能
- 物件情報編集機能
- 物件内の部屋情報登録機能
- 部屋情報登録機能
- 部屋情報削除機能
- 部屋情報編集機能
- アプローチ（コメント）機能
- 部屋情報削除機能
- 商品登録機能

## DEMO

#### トップページ
[![Image from Gyazo](https://i.gyazo.com/2f7facf256125fae60942a5e9809ca68.png)](https://gyazo.com/2f7facf256125fae60942a5e9809ca68)

アプリ名をクリックするとこのページに遷移します。
登録した物件が一覧で出るようになっています。


#### 登録画面
[![Image from Gyazo](https://i.gyazo.com/9826247f444f3fc5dd20b0fb5df79d5a.gif)](https://gyazo.com/9826247f444f3fc5dd20b0fb5df79d5a)

各情報を入力することで物件の登録をすることができます。



#### 物件・部屋情報詳細ページ
[![Image from Gyazo](https://i.gyazo.com/3243d6aec919bb4d594896cd475c91e4.gif)](https://gyazo.com/3243d6aec919bb4d594896cd475c91e4)

物件名から検索することができます。



[![Image from Gyazo](https://i.gyazo.com/a6dcf778309bf3d7bfe981c8c6158bb9.gif)](https://gyazo.com/a6dcf778309bf3d7bfe981c8c6158bb9)

物件名をクリックすると、物件詳細ページに遷移します。
物件詳細ページでは部屋情報が一覧になっており、部屋番号をクリックすると
部屋情報詳細ページに遷移します。

### 部屋情報詳細ページ
[![Image from Gyazo](https://i.gyazo.com/0739b0121ad01579c03ea763bcfbe91b.png)](https://gyazo.com/0739b0121ad01579c03ea763bcfbe91b)

部屋情報詳細と、アプローチを登録できます。

## 使用技術（開発環境）

### バックエンド
Ruby, Ruby on Rails

### フロントエンド
HTML, CSS

### データベース
MySQL

### 本番環境
heroku

### ソース管理
GitHub, GitHubDesktop

### エディタ
VSCode



## 実装予定
- 商品検索機能
- 見積もり作成機能
- テスト



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

| Column           | Type    | Options     |
| ---------------- | ------- | ------------|
| property_name    | string  | null: false |
| address          | text    | null: false |
| remarks          | text    |             |
| parking_id       | integer |             |
| gas_id           | integer |             |
| property_kind_id | integer | null: false |

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
| existing_information | string     |                                |
| existing_maker       | string     |                                |
| construction_day     | string     |                                |

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
| Column         | Type    | Options     |
| -------------- | ------- | ------------|
| item_name      | string  | null: false |
| product_number | string  | null: false |
| price          | integer | null: false |
| rate           | integer |             |
| gas_id         | integer |             |
| supplier       | string  |             |

### Association
has_many :quotation
