class News < ActiveRecord::Base
  belongs_to :category, :class_name => 'NewsCategory'
  has_many :contents, :class_name => 'NewsContent'
end