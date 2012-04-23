class ChronicleRating < ActiveRecord::Migration
  def up
    add_column :chronicles, :rating, :integer, :default => 0
  end

  def down
    remove_column :chronicles, :rating
  end
end
