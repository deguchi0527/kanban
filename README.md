# テーブル設計


## users テーブル

| Column             | Type   | Options                   |
| -------------------| ------ | ------------------------- |
| name               | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |

### Association

- has_many :lists


## lists テーブル

| Column             | Type       | Options                        |
| -------------------| ---------- | ------------------------------ |
| title              | string     | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association

- has_many :cards
- belongs_to :user


## cards テーブル

| Column             | Type       | Options                        |
| -------------------| ---------- | ------------------------------ |
| title              | string     | null: false                    |
| memo               | string     | null: false                    |
| list               | references | null: false, foreign_key: true |

### Association

- belongs_to :list