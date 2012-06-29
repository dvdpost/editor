class News < ActiveRecord::Migration
  def up
    create_table :news do |t|
      t.string :name
      t.integer :category_id
      t.column :status, "ENUM('TEST', 'DELETED', 'ONLINE')", :default => "TEST"
      t.integer :rating
      t.integer :imdb_id
      t.string :author
      t.timestamps
    end
    create_table :news_contents do |t|
      t.string :title
      t.string :subtitle
      t.text :description
      t.text :full_description
      t.integer :news_id
      t.integer :language_id
      t.column :status, "ENUM('TEST', 'DELETED', 'ONLINE')", :default => "TEST"
      t.timestamps
    end
    add_index :news_contents, :news_id
  end

  def down
    drop_table :news
    drop_table :news_contents
  end
end
