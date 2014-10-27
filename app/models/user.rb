class User < ActiveRecord::Base
	belongs_to :league
	has_many :authorizations
	validates :name, :email, :presence => true

	include HTTParty
  	base_uri 'api.fitbit.com'


	# def add_provider(auth_hash)
	#  	# Check if the provider already exists, so we don't add it twice
	#   	unless authorizations.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"])
	#     	Authorization.create :user => self, :provider => auth_hash["provider"], :uid => auth_hash["uid"]
	#   	end
	# end
	# Use the class methods to get down to business quickly
	

	def self.create_with_omniauth(auth)
		create! do |user|
	    # user.email = auth["extra"]["raw_info"]["email"]
	    user.provider = auth["provider"]
	    user.uid = auth["uid"]
	    # user.access_token = 
	    # user.name = auth["extra"]['raw_info']['login']
	  end
    end

    def find_steps
    	response = HTTParty.get('/1/user/-/activities/steps.json')

    	puts response
    end
end