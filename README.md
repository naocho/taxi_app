# テーブル設計

## users テーブル

| Column                 | Type   | Options     |
| ---------------------- | ------ | ----------- |
| nickname               | string | null: false |
| email                  | string | null: false |
| encrypted_password     | string | null: false |


##  has_many :taxis
##  has_many :comments

## taxis テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| user         | references | null: false, foreign_key: true |
| departure    | string     | null: false                    |
| arrival      | string     | null: false                    |
| title        | string     | null: false                    |
| text         | string     | null: false                    |

## belongs_to :user
## has_many :comments
## has_one_attached :image

## comments テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| user_id      | bigint     | null: false, foreign_key: true |
| taxi         | references | null: false, foreign_key: true |
| text         | text       | null: false                    |


<!-- このアプリの作った経緯

色々な方のポートフォリオを参考にしたり、コメントを頂いたりして初学者のモチベーションの意地
また日々の技術の発展に繋げられたらと思いこのアプリを作りました。
