class AddBooleanToSystems < ActiveRecord::Migration
  def change
    add_column :systems, :owned, :boolean
  end
end
