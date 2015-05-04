class ChangeDatatypeBookOfTrun < ActiveRecord::Migration
  def change
  	change_column :books, :turn, :integer
  end
end
