class AddValuesToSystems < ActiveRecord::Migration
  def change
    add_column :systems, :release_year, :integer
    add_column :systems, :played, :integer
  end
end
