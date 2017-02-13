class AddUrlToSystems < ActiveRecord::Migration
  def change
    add_column :systems, :url, :string
  end
end
