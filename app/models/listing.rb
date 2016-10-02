class Listing < ActiveRecord::Base
	if Rails.env.production?
		has_attached_file :image, styles: { thumb: '100x100>', square: '200x200#', medium: '300x300>' }, validate_media_type: false, default_url: "default.jpg"
	else
		has_attached_file :image, styles: { thumb: '100x100>', square: '200x200#', medium: '300x300>' }, validate_media_type: false, default_url: "default.jpg",
		  storage: :s3,
  		  s3_protocol: 'http',
  		  s3_credentials: Rails.root.join("config/application.yml"),
  		  path: "/:class/:attachment/:id_partition/:style/:filename"
		
	end

	validates :name, :description, :price, presence: true
	validates :price, numericality: { greater_than: 0 }
	validates_attachment_presence :image
end