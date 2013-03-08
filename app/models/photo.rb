class Photo < ActiveRecord::Base
  belongs_to :album
  attr_accessible :caption, :description, :image

  validates_presence_of :caption, :description, :image
end
