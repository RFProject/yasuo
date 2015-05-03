class CreateSeries < ActiveRecord::Migration
  def change
    create_table :series do |t|
      t.string :name
      t.string :author
      t.text :description
      t.string :image

      t.timestamps null: false
    end
  end
end
