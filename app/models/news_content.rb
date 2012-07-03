class NewsContent < ActiveRecord::Base
  belongs_to :news
  has_attached_file :cover, :styles => { :small => "369x245>" },
                            :url  => "http://private.dvdpost.com/images/news_covers/:id/:style/:basename.:extension",
                            :path => "/home/webapps/dvdpostapp/production/shared/uploaded/news/:id/:style/:basename.:extension"
  has_attached_file :thumbs, :styles => { :small => "180x127>" },
                             :url  => "http://private.dvdpost.com/images/news_thumbs/:id/:style/:basename.:extension",
                             :path => "/home/webapps/dvdpostapp/production/shared/uploaded/news_thumbs/:id/:style/:basename.:extension"
end