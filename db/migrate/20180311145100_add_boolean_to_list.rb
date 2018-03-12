class AddBooleanToList < ActiveRecord::Migration[5.1]
  def change
  	add_column :lists,:completed,:boolean
  end
end
