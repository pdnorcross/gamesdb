class AddCNameToGames < ActiveRecord::Migration
  def change
    add_column :games, :c_name, :string
  end
end
