class WelcomeController < ApplicationController

	def index
		@user = session["user"]
	end
end