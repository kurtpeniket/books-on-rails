class AddNotesToBooks < ActiveRecord::Migration[6.0]
  def change
    add_column :books, :note, :text
  end
end
