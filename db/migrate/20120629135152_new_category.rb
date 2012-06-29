class NewCategory < ActiveRecord::Migration
  def up
    create_table :news_categories do |t|
      t.string  :name
      t.timestamps
    end
  end

  def down
    drop_table :news_categories
  end
end
