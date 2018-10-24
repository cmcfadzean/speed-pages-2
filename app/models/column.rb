class Column < ActiveRecord::Base
  belongs_to :section
  has_many :blocks
end
