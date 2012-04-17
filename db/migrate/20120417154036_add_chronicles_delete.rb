class AddChroniclesDelete < ActiveRecord::Migration
  def up
    rename_column :chronicles, :deleted, :selected
  end

  def down
    rename_column :chronicles, :selected, :deleted
  end
end
