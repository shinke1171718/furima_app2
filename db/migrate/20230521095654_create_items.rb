class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :name,                 null: false, default: ""
      t.text :explanation,            null: false, default: ""
      t.integer :price,               null: false, default: ""
      t.string :image,                null: false, default: ""
      t.text :image_meta_data,        null: false, default: ""
      t.string :seller_id,            null: false, default: ""
      t.string :buyer_id
      t.timestamps
    end
  end
end
