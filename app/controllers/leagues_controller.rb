class LeaguesController < ApplicationController
	def index
		@leagues = League.all
	end

	def show
		@league = League.find(params[:id])
	end

	def create
		@league = League.new(league_params)
		if @league.save
			redirect_to action: :index 
		end

		 # if @league.save
   #    		redirect_to action: :index
   #  	else
   #    		render 'new'
   #    		flash[:notice] = "Didn't work"
   #  	end
		
	end

	def new
		@league = League.new
	end

private

	def league_params
		params.require(:league).permit(:name)
	end
end