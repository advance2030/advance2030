class ChangeSocialMediaFromUsernameToUrl < ActiveRecord::Migration
  def self.up
    rename_column :organization_social_medias, :username, :url
  end

  def self.down
    rename_column :organization_social_medias, :url, :username
  end
end
