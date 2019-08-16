class AddColumnPublic < ActiveRecord::Migration[5.2]
  def change
    add_column :comics, :public, :boolean
  end
end
