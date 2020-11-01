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

タクシー業界は会社は新しいアプリで仕事をどんどん増やして行きたいが年齢が高いためドライバー側が使わない方が多い
その為、利用者のレビューで会社の事務側がログイン機能でお客様を把握し割引の対象にするアプリを作りたいと思いました。


