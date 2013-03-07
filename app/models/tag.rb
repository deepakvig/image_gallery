class Tag < ActiveRecord::Base
  attr_accessible :content

  belongs_to :taggable, polymorphic: true
end
