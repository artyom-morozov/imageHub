class RemovePriceFromImage < ActiveRecord::Migration[6.1]
  def change
    remove_column :images, :price, :float
    remove_column :images, :private, :boolean
  end
end
