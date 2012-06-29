class NewsContent < ActiveRecord::Base
  belongs_to :news
  has_attached_file :cover, :styles => { :small => "237>x237" },
                            :url  => "http://private.dvdpost.com/images/news/covers/:id/:style/:basename.:extension",
                            :path => "/home/webapps/dvdpostapp/production/shared/uploaded/news/:id/:style/:basename.:extension"
end