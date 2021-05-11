class CreateCategorizedImages < ActiveRecord::Migration[6.1]
  def change
    create_table :categorized_images do |t|
      t.references :image, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
