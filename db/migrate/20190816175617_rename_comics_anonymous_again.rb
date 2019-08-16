class RenameComicsAnonymousAgain < ActiveRecord::Migration[5.2]
  def change
    rename_column :comics, :anonymous, :anonymous?
  end
end
