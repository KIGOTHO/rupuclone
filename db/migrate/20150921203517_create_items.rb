class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title
      t.decimal :price_from
      t.decimal :price_to
      t.decimal :price_save
      t.text :description
      t.string :image_url
      t.references :product, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
