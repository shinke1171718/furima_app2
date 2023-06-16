class CreateSecondaddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :secondaddresses do |t|
      t.references :user, null: false, foreign_key: true
      t.string :second_postal_code,            nill: false, default: ""
      t.string :second_address1,            nill: false, default: ""
      t.string :second_address2,            nill: false, default: ""
      t.timestamps
    end
  end
end
