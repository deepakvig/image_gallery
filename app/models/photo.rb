class Photo < ActiveRecord::Base
  belongs_to :album
  attr_accessible :caption, :description, :image

  mount_uploader :image, ImageUploader

  #validates_presence_of :caption, :description, :image
  before_create :default_name do
    self.caption ||= File.basename(image.filename, ".*").titleize if image
  end
end
