class Order < ActiveRecord::Base
  
  has_many :transactions, :class_name => 'OrderTransaction',:dependent => :destroy  
  
end
