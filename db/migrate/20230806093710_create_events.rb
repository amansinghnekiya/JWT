class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.datetime :date
      t.string :location
      t.integer :ticket_availability
      t.integer :price

      t.timestamps
    end
  end
end
