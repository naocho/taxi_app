class CreateTaxis < ActiveRecord::Migration[6.0]
  def change
    create_table :taxis do |t|
      t.references :user,                null: false, foreign_key: true
      t.string :name
      t.string :text
      t.text :image
      t.timestamps
    end
  end
end
