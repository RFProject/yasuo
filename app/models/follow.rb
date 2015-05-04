class Follow < ActiveRecord::Base
	belongs_to :user
	belongs_to :series

	validates :user_id,
	uniqueness: {
		message: "Alredy you have followed this series!",
		scope: [:series_id]
	}

	def next_book
		self.series.books.all.each do |book|
			unless self.user.reads.exists?(:book_id => book.id)
				return book
			end
		end
		return
	end
end