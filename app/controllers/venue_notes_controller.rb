class VenueNotesController < ApplicationController
  before_filter :find_venue
  before_filter :find_note, :only => [:show, :edit, :update, :destroy]
  
  def new
    @venue_note = @venue.notes.build
  end

  def create
    begin
      @venue_note = @venue.notes.build(params[:venue_note])
      @venue_note.save!
      flash_and_redirect(edit_venue_path(@venue), 'Note has been created!')
    rescue ActiveRecord::RecordInvalid
      render_edit
    end
  end

private
  def find_venue
    begin
      @venue = Venue.find_by_url_friendly!(params[:venue_id])
    rescue ActiveRecord::RecordNotFound
      render_404
    end
  end
end
