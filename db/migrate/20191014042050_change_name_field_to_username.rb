class ChangeNameFieldToUsername < ActiveRecord::Migration[5.0]
  def up
    change_column :users, :name, :username
  end

  def down
    change_column :users, :username, :name 
  end
end
