class Post < ActiveRecord::Base
  acts_as_gmappable

  belongs_to :user
  has_and_belongs_to_many :tags

  def gmaps4rails_address
  # describe how to retrieve the address from your model, if you use directly a db column, you can dry your code, see wiki
    # puts "setting latitude to #{self.latitude}"
    "#{self.latitude}, #{self.longitude}"
  end

  def ip_address
    Array.new(4){rand(256)}.join('.')
  end

  def gmaps4rails_infowindow
    "#{self.text[0..200]}... <br /> #{self.tags.map do |tag| tag.tag end } <a href='/posts/#{self.id}'>See more...</a>"
  end

  reverse_geocoded_by :latitude, :longitude do |obj,results|
    if geo = results.first
      obj.zipcode = geo.postal_code
    end
  end
  after_validation :reverse_geocode

  attr_accessible :text, :zipcode, :latitude, :longitude
end