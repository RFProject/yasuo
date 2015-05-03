class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :turn
      t.date :released_at
      t.text :description
      t.string :image
      t.integer :series_id
      t.string :amazon_url

      t.timestamps null: false
    end
  end
end
