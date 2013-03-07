class Comment < ActiveRecord::Base
  attr_accessible :content, :email, :name

  belongs_to :commentable, polymorphic: true

  validates_presence_of :name, :email, :content
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
end
