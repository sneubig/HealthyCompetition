class LeaguesController < ApplicationController
	def index
		@leagues = League.all
	end

	def show
		@league = League.find(params[:id])
		# redirect_to '/league/<%= league.id %>'
	end

	def create
		@league = League.new(league_params)
		if @league.save
			redirect_to leagues_path
		end
	end

	def new
		@league = League.new
	end

private

	def league_params
		params.require(:league).permit(:name)
	end
end