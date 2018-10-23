class Page < ActiveRecord::Base
  validates :title,  :presence => true
  validates :url, :presence => true

  has_many :sections
  has_many :columns
end
