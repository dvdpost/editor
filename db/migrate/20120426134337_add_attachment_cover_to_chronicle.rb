class AddAttachmentCoverToChronicle < ActiveRecord::Migration
  def self.up
    add_column :chronicles, :cover_file_name, :string
    add_column :chronicles, :cover_content_type, :string
    add_column :chronicles, :cover_file_size, :integer
    add_column :chronicles, :cover_updated_at, :datetime
  end

  def self.down
    remove_column :chronicles, :cover_file_name
    remove_column :chronicles, :cover_content_type
    remove_column :chronicles, :cover_file_size
    remove_column :chronicles, :cover_updated_at
  end
end
