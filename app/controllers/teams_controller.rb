class TeamsController < ApplicationController

	def index
		@league = League.find(params[:league_id])
		@teams = Team.all
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