class Follow < ActiveRecord::Base
	belongs_to :user
	belongs_to :series

	validates :user_id,
	uniqueness: {
		message: "Alredy you have followed this series!",
		scope: [:series_id]
	}
end
