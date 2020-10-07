class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.bigint     :user_id,  null: false, foreign_key: true
      t.references :taxi,     null: false, foreign_key: true
      t.text :text
      t.timestamps
    end
  end
end
