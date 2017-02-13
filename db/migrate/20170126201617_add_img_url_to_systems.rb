class AddImgUrlToSystems < ActiveRecord::Migration
  def change
    add_column :systems, :img_url, :string
  end
end
