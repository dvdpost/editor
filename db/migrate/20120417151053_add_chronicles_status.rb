class AddChroniclesStatus < ActiveRecord::Migration
  def self.up
    add_column :chronicles, :status, 'enum("TEST", "ONLINE","DELETED")', :default => "TEST"
  end

  def self.down
    remvove_column :chronicles, :status
  end
end
