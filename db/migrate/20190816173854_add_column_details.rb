class AddColumnDetails < ActiveRecord::Migration[5.2]
  def change
    add_column :comics, :details, :text
  end
end
