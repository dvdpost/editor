class ChroniclesAddFirld < ActiveRecord::Migration
  def up
    add_column :chronicles, :deleted, :boolean, :default => 0
    rename_column :chronicles, :title, :name
    remove_column :chronicles, :subtitle
    remove_column :chronicles, :description
    remove_column :chronicles, :full_description
    
  end

  def down
    remove_column :chronicles, :deleted
    rename_column :chronicles, :name, :title
    add_column :chronicles, :subtitle, :string
    add_column :chronicles, :description, :text
    add_column :chronicles, :full_description, :text
  end
end
