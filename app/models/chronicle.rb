class Chronicle < ActiveRecord::Base
  belongs_to :category, :class_name => 'ChronicleCategory'
  has_many :contents, :class_name => 'ChronicleContent'
end
