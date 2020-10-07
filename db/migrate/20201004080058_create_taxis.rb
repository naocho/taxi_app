class CreateTaxis < ActiveRecord::Migration[6.0]
  def change
    create_table :taxis do |t|
      t.references :user,                null: false, foreign_key: true
      t.string :departure
      t.string :arrival
      t.string :title
      t.string :text
      t.timestamps
    end
  end
end
