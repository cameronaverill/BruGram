class Photo < ActiveRecord::Base

  acts_as_votable
  before_create :default_values
  def default_values
    self.likes ||= 0
  end
  belongs_to :user
  has_many :comments, dependent: :destroy
end
