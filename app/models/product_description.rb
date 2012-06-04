class ProductDescription < ActiveRecord::Base
  self.table_name = :products_description

  self.primary_key = :products_id
  alias_attribute :text,    :products_description
  alias_attribute :title,   :products_name

  belongs_to :product, :primary_key => :products_id, :foreign_key => :products_id
end