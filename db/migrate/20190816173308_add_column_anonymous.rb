class AddColumnAnonymous < ActiveRecord::Migration[5.2]
  def change
    add_column :comics, :anonymous, :boolean
  end
end
