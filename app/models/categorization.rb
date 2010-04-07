class Categorization < ActiveRecord::Base
  set_table_name :categorizations

  belongs_to :event
  belongs_to :category
end