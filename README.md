# 工助(kousuke)

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
