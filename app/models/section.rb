class Section < ActiveRecord::Base
  validates :title,  :presence => true
  validates :section_type, :presence => true

  belongs_to :page
end
