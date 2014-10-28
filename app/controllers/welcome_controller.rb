class WelcomeController < ApplicationController

	def index
		# raise session.to_yaml
		# reset_session

		access_token = User.prepare_access_token(session[:token] ,session[:token_secret]  )
	 
		# use the access token as an agent to get the home timeline
		@response = access_token.request(:get, "http://api.fitbit.com/1/user/-/activities/goals/weekly.json") 
		@activities = access_token.request(:get, "http://api.fitbit.com/1/user/-/activities/date/2014-10-27.json")
		

	end
end