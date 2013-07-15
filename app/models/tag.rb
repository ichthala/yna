class Tag < ActiveRecord::Base
  has_and_belongs_to_many :posts

  validates :tag, presence: true, uniqueness: true
  attr_accessible :tag
end