class PagesController < ApplicationController
	before_action only: [:index]
	before_action :authenticate_user!

	def index
		@follows = current_user.follows
	end
end
