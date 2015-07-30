class Comment < ActiveRecord::Base

  acts_as_votable
  before_create :default_values
  def default_values
    self.likes ||= 0
  end

  belongs_to :photo
  belongs_to :user
end
