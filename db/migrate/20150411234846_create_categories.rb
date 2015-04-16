class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.text :explain
      t.integer :level
      t.integer :parent_id
      t.integer :branch_id

      t.timestamps null: false
    end
  end
end
