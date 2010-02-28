class VenuesController < ApplicationController
  before_filter :find_venue, :only => [:show, :edit, :update, :destroy, :destroy_avatar]
  before_filter :find_venue_options, :find_parking_options, :find_fee_options, :find_food_service_options, :find_av_equipment_options, :only => [:new, :edit, :update, :create]

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

  def destroy_avatar
    @venue.destroy_avatar!

    respond_to do |wants|
      wants.html { flash_and_redirect(venues_path, 'Avatar has been removed') }
      wants.js { render :layout => false }
    end
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

  def find_parking_options
    @parking_options = ParkingOption.list
  end

  def find_fee_options
    @fee_options = FeeOption.list
  end

  def find_food_service_options
    @food_service_options = FoodServiceOption.list
  end

  def find_av_equipment_options
    @av_equipment_options = AvEquipmentOption.list
  end
end
