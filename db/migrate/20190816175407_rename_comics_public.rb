class RenameComicsPublic < ActiveRecord::Migration[5.2]
  def change
    rename_column :comics, :public, :public?
  end
end
