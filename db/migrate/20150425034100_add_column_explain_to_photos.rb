class AddColumnExplainToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :explain, :text
  end
end
