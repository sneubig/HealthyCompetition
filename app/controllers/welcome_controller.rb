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
		


		# gets weekly steps
		@weekly_steps = access_token.request(:get, "http://api.fitbit.com/1/user/-/activities/steps/date/today/7d.json")
		@week_steps_summary = JSON.parse(@weekly_steps.body)["activities-steps"]

		# @week_steps_date = JSON.parse(@week_steps_summary)["dateTime"]	
	end
end