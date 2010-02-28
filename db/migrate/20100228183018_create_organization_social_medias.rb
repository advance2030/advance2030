class CreateOrganizationSocialMedias < ActiveRecord::Migration
  def self.up
    create_table :organization_social_medias do |t|
      t.integer :social_media_type_id, :null => false
      t.integer :organization_id, :null => false
      t.string :username, :null => false
      t.integer :sort_order
      t.timestamps
    end
    
    add_index :organization_social_medias, :social_media_type_id
    add_index :organization_social_medias, :organization_id
    add_index :organization_social_medias, :username, :unique => true
  end

  def self.down
    drop_table :organization_social_medias
  end
end
