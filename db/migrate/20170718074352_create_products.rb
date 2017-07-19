class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :price
      t.datetime :released_on
      t.references :category, index: true

      t.timestamps
    end
  end
end
