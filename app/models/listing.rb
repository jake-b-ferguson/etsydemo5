class Listing < ActiveRecord::Base
	has_attached_file :image, styles: { medium: "200x", thumb: "100x100>" }, validate_media_type: false, default_url: "default.jpg"
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/


	belongs_to :user
end