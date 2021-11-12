# 工助(kousuke)

## users テーブル


| Column             | Type   | Opinions                  |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |

### Association
- has_many :properties
- has_many :constructions


## properties

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| property_name        | string     | null: false                    |
| address              | text       | null: false                    |
| existing_information | integer    |                     |
| new_information      | string     | 
| construction_details | integer    |                     |

### Association
- belongs_to :user
- has_many :construction

## construction

| Column               | Type       | Opinions                       |
| -------------------- | ---------- | ------------------------------ |
| construction_time_id | string     | null: false                    |
| instructions         | integer    | null: false                    |
| important_point      | string     | null: false                    |
| remarks              | string     | null: false                    |

### Association
- belongs_to :user
- belongs_to :construction