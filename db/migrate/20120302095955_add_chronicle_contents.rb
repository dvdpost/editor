class AddChronicleContents < ActiveRecord::Migration
  def up
    create_table :chronicle_contents do |t|
      t.string :title
      t.string :subtitle
      t.text :description
      t.text :full_description
      t.integer :chronicle_id
      t.integer :language_id

      t.timestamps
    end
    add_index :chronicle_contents, :chronicle_id
  end

  def down
    drop_table :chronicle_contents
  end
end
