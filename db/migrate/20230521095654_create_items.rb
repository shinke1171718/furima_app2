class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :name,                 nill: false, default: ""
      t.text :explanation,            nill: false, default: ""
      t.integer :price,               nill: false, default: ""
      t.string :seller_id,            nill: false, default: ""
      t.string :buyer_id
      t.timestamps
    end
  end
end
