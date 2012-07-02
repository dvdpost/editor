class AddAttachmentThumbsToNewsContents < ActiveRecord::Migration
  def self.up
    add_column :news_contents, :thumbs_file_name, :string
    add_column :news_contents, :thumbs_content_type, :string
    add_column :news_contents, :thumbs_file_size, :integer
    add_column :news_contents, :thumbs_updated_at, :datetime
  end

  def self.down
    remove_column :news_contents, :thumbs_file_name
    remove_column :news_contents, :thumbs_content_type
    remove_column :news_contents, :thumbs_file_size
    remove_column :news_contents, :thumbs_updated_at
  end
end
