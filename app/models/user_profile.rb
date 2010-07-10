require 'paperclip'
class UserProfile < ActiveRecord::Base
  has_attached_file :avatar,
                    :styles => { :medium => "80x80>", :thumb => "50x50" }
  
  def member_since
    self.created_at
  end
  
  belongs_to :user

end
