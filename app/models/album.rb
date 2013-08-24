class Album < ActiveRecord::Base
  belongs_to :user
  attr_accessible :blog_link, :caption, :description, :title

  validates_presence_of :title, :caption, :description

  acts_as_taggable
  has_many :comments, as: :commentable
  has_many :photos
end
