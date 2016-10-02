class AddImageToListing < ActiveRecord::Migration
 def self.up
    add_attachment :listing, :image
  end

  def self.down
    remove_attachment :listing, :image
  end
end
