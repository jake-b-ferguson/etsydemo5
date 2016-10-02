class Listing < ActiveRecord::Base
	has_attached_file :image, styles: { thumb: '100x100>', square: '200x200#', medium: '300x300>' }, default_url: "default.jpg"
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/


	belongs_to :user
end