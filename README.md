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

タクシーや運転代行はお客様のルートや時間により値段が変わる為
正確な値段をお伝えする事が出来ない。
また多少の値段ですら伝えた場合もし値段が違えば客とのトラブルになる
その為、利用者のレビューを見てある程度の値段を判断してもらう事は
良いのではと思いました。 -->


