class PagesController < ApplicationController
	before_action only: [:index]
	before_action :authenticate_user!

	def index

	end
end
