class OrganizationsController < ApplicationController
  before_filter :find_organization, :only => [:show, :edit, :update, :destroy, :destroy_logo]
  before_filter :find_service_regions, :find_organization_type_options, :find_roles, :find_industries, :only => [:new, :create, :edit, :update]
  
  def index
    @organizations = Organization.list
  end

  def new
    @organization = Organization.new
  end
  
  def create
    begin
      @organization = Organization.new(params[:organization])
      @organization.save!
      flash_and_redirect(organizations_path, 'Organization has been created!')
    rescue ActiveRecord::RecordInvalid
      render_new
    end
  end
  
  def update
    begin
      @organization.update_attributes!(params[:organization])
      flash_and_redirect(organizations_path, 'Organization has been updated!')
    rescue ActiveRecord::RecordInvalid
      render_edit
    end
  end
  
  def destroy
    @organization.destroy
    flash_and_redirect(organizations_path, 'Organization has been removed!')
  end
  
  def destroy_logo
    @organization.destroy_logo!
    
    respond_to do |wants|
      wants.html
      wants.js { render :layout => false }
    end
  end

private
  def find_organization
    begin
      @organization = Organization.find_by_id!(params[:id])
    rescue ActiveRecord::RecordNotFound
      render_404
    end
  end
  
  def find_service_regions
    @service_region_options = ServiceRegion.options
  end
  
  def find_organization_type_options
    @organization_type_options = OrganizationType.options
  end
  
  def find_roles
    @roles = OrganizationRole.list
  end
  
  def find_industries
    @industries = Industry.list
  end
end
