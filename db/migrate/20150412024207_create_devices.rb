class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.integer :category_id
      t.string :brand
      t.string :brand_type
      t.string :serial_number
      t.text :inward_config
      t.text :external_config
      t.integer :branch_id
      t.string :member
      t.text :purpose
      t.string :fix
      t.date :purchase
      t.date :used
      t.date :guaranteed
      t.date :reject
      t.integer :status
      t.string :face

      t.timestamps null: false
    end
  end
end
