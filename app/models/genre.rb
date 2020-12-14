class Genre < ApplicationRecord


  include ActiveHash::Associations
  has_many :articles

end
