class RemoveUrlFromImages < ActiveRecord::Migration[6.1]
  def change
    remove_column :images, :url, :string
  end
end
