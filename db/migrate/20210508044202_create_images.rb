class CreateImages < ActiveRecord::Migration[6.1]
  def change
    create_table :images do |t|
      t.string :title
      t.text :description
      t.float :price
      t.boolean :private
      t.text :url

      t.timestamps
    end
  end
end
