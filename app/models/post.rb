class Post < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :tags

  reverse_geocoded_by :latitude, :longitude do |obj,results|
    if geo = results.first
      obj.zipcode = geo.postal_code
    end
  end

  after_validation :reverse_geocode
end