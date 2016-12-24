class CreateTacos < ActiveRecord::Migration
  def change
    create_table :tacos do |t|
      t.string :name
      t.references :flame, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
