# Need json gem to parse the json returned from api 
require 'json'

class WelcomeController < ApplicationController

	def index
		# raise session.to_yaml
		# reset_session

		access_token = User.prepare_access_token(session[:token], session[:token_secret])
	 
		# gets the weekly activity goals 
		@response = access_token.request(:get, "http://api.fitbit.com/1/user/-/activities/goals/weekly.json") 
		
		#gets all the activity stats for particular day
		@activities = access_token.request(:get, "http://api.fitbit.com/1/user/-/activities/date/2014-10-27.json")
		# Returning steps 
		@summary = JSON.parse(@activities.body)["summary"]["steps"]
	end
end