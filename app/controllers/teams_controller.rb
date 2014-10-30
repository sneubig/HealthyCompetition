class TeamsController < ApplicationController

	def index
		@league = League.find(params[:league_id])
		@teams = Team.all
		@teams_sorted = Team.order('steps DESC')
		access_token = User.prepare_access_token(session[:token], session[:token_secret])
		#gets all the activity stats for particular day
		@activities = access_token.request(:get, "http://api.fitbit.com/1/user/-/activities/date/2014-10-27.json")
		# Returning steps 
		@summary = JSON.parse(@activities.body)["summary"]["steps"]
	end

	def show
		@league = League.find(params[:league_id])
		@team = Team.find(params[:id])
	end

	def create
		@league = League.find(params[:league_id])
		@team = Team.new(team_params)
		if @team.save
			redirect_to action: :index 
		end
	end

	def new
		# @league = League.find(params[:league_id])
		@team = Team.new
	end

	
private

	def team_params
		params.require(:team).permit(:name)
	end
end