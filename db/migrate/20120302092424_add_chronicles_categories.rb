class AddChroniclesCategories < ActiveRecord::Migration
  def up
    add_column :chronicles, :category_id, :integer
    create_table :chronicle_categories do |t|
      t.string  :name
		  
      t.timestamps
    end
  end

  def down
    remove_column :chronicles, :category_id
    drop_table :chronicle_categories
  end
end
