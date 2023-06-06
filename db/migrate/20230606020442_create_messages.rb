class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.text :comment,            null: false, default: ""
      t.timestamps
    end
  end
end
