class Section < ActiveRecord::Base
  belongs_to :page
  validates :title,  :presence => true
  validates :type, :presence => true
end
