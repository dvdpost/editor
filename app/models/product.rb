class Product < ActiveRecord::Base
  self.table_name = :products
  self.primary_key = :products_id
end