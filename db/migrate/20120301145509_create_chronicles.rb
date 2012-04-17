class CreateChronicles < ActiveRecord::Migration
  def change
    create_table :chronicles do |t|
      t.string :title
      t.string :subtitle
      t.text :description
      t.text :full_description

      t.timestamps
    end
  end
end
