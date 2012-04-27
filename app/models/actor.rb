class Actor < ActiveRecord::Base
  set_primary_key :actors_id

  alias_attribute :name, :actors_name
  alias_attribute :type, :actors_type
end
