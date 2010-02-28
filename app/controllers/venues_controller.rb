class VenuesController < ApplicationController
  before_filter :find_venue, :only => [:show, :edit, :update, :destroy]
  before_filter :find_venue_options, :only => [:new, :edit, :update, :create]
  
  def index
    @venues = Venue.list
  end

  def new
    @venue = Venue.new
  end

  def create
    begin
      @venue = Venue.new(params[:venue])
      @venue.save!
      flash_and_redirect(venues_path, 'Venue has been created!')
    rescue ActiveRecord::RecordInvalid
      render_new
    end
  end
  
  def update
    begin
      @venue.update_attributes!(params[:venue])
      flash_and_redirect(venues_path, 'Venue has been updated!')
    rescue ActiveRecord::RecordInvalid
      render_edit
    end
  end
  
  def destroy
    @venue.destroy
    flash_and_redirect(venues_path, 'Venue has been removed!')
  end
  
private
  def find_venue
    begin
      @venue = Venue.find_by_url_friendly!(params[:id])
    rescue ActiveRecord::RecordNotFound
      render_404
    end
  end
  
  def find_venue_options
    @venue_options = VenueType.options
  end
end