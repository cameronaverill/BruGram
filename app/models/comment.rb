class Comment < ActiveRecord::Base

  acts_as_votable

  belongs_to :photo
  belongs_to :user
end
