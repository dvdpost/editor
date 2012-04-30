class ChronicleImdb < ActiveRecord::Migration
  def up
    add_column :chronicles, :imdb_id, :integer
  end

  def down
    remove_column :chronicles, :imdb_id
  end
end
