class CreateBranches < ActiveRecord::Migration
  def change
    create_table :branches do |t|
      t.string :branchname
      t.string :coding
      t.integer :parent_id
      t.integer :status

      t.timestamps null: false
    end
  end
end
