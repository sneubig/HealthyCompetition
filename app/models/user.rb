class User < ActiveRecord::Base
	belongs_to :league
	has_many :authorizations
	validates :name, :presence => true

	include HTTParty
  	base_uri 'api.fitbit.com'
	
	# Creates info for person with new session
	def self.create_with_omniauth(auth)
		create! do |user|
	    	user.email = auth["extra"]["raw_info"]["email"]
	   	 	user.provider = auth["provider"]
	    	user.uid = auth["uid"]
	    	user.name = auth["info"]["name"]
	    	user.access_token = auth["credentials"]["token"]
	    	user.token_secret = auth["credentials"]["secret"]
	  	end
    end

    def find_steps
    	response = HTTParty.get('/1/user/-/activities/steps.json')

    	puts response
    end
end