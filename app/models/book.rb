class Book < ActiveRecord::Base
  belongs_to :series
  has_many :reads
  has_many :users, :through => :reads
end
