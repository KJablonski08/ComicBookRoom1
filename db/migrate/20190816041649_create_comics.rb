class CreateComics < ActiveRecord::Migration[5.2]
  def change
    create_table :comics do |t|
      t.string :title 
      t.string :series 
      t.integer :issue 
      t.string :author 
      t.integer :user_id
      t.timestamps
    end
  end
end
