class Section < ActiveRecord::Base
  validates :title,  :presence => true

  belongs_to :page
  has_many :columns
end
