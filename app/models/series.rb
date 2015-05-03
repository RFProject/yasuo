class Series < ActiveRecord::Base
	has_many :books
	has_many :follows
	has_many :users, :through => :follows
end
