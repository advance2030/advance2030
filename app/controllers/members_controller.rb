class MembersController < ApplicationController
  def index
    @members = User.all_members
	end	

  def detail
    @member = User.find_by_url_friendly(params[:id])
  end
end


=begin
    unless @members.empty?    
      @registered_members = @members.active
      @unregistered_members = @members - @registered_members
    else
      @registered_members = []
      @unregistered_members = []
    end
  end
=end