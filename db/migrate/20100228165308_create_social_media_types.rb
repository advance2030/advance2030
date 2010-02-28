class CreateSocialMediaTypes < ActiveRecord::Migration
  def self.up
    create_table :social_media_types do |t|
      t.string :title, :null => false, :limit => 100
      t.text :description
    end
  end

  def self.down
    drop_table :social_media_types
  end
end
