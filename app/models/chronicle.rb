class Chronicle < ActiveRecord::Base
  belongs_to :category, :class_name => 'ChronicleCategory'
  has_many :contents, :class_name => 'ChronicleContent'
  has_attached_file :cover, :styles => { :small => "237>x237" },
                            :url  => "http://private.dvdpost.com/images/chronicles/covers/:id/:style/:basename.:extension",
                            :path => "/home/webapps/dvdpostapp/production/shared/uploaded/chronicles/:id/:style/:basename.:extension"

end
