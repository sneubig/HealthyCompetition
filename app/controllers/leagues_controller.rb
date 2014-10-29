class LeaguesController < ApplicationController
	def index
		@leagues = League.all
	end

	def show
		@league = League.find(params[:id])
		# redirect_to '/league/<%= league.id %>/teams'
	end

	def create
		@league = League.new(league_params)
		if @league.save
			redirect_to '/league/<%= league.id %>/teams/new'
		end
	end

	def new
		@league = League.new
		redirect_to '/league/<%= league_id %>/teams/new'
	end

private

	def league_params
		params.require(:league).permit(:name)
	end
end