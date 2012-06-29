class NewsKind < ActiveRecord::Migration
  def up
    add_column :news, :kind, 'enum("ADULT", "NORMAL")', :default => "NORMAL"
  end

  def down
    remove_column :news, :kind
  end
end
