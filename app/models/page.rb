class Page < ActiveRecord::Base
  has_many :sections
  validates :title,  :presence => true
  validates :url, :presence => true
end
