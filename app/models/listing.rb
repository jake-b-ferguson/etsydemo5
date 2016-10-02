class Listing < ActiveRecord::Base
		has_attached_file :image, styles: { thumb: '100x100>', square: '200x200#', medium: '300x300>' }, validate_media_type: false, default_url: "default.jpg"
		validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/


	validates :name, :description, :price, presence: true
	validates :price, numericality: { greater_than: 0 }
	validates_attachment_presence :image

	belongs_to :user
end