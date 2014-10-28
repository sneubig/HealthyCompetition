require 'oauth'
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

    # def find_steps
    # 	response = HTTParty.get("http://api.fitbit.com/1/user/#{self.uid}/activities/goals/weekly.json", :headers => {:key => 'ec56b57fd3034d9bbe6c27bb4835546f', :secret => '6c9b616eb9ed72c078d94b81ebd707f2', :token => '31632a2e0761fee574a353dfdf1466ad'})
    # end

    # Exchange your oauth_token and oauth_token_secret for an AccessToken instance.
	def self.prepare_access_token(oauth_token, oauth_token_secret)
	    consumer = OAuth::Consumer.new("ec56b57fd3034d9bbe6c27bb4835546f", "91e174c9818d4696bf34d9213c508cc0", { :site => "http://api.fitbit.com", :scheme => :header })
	     
	    # now create the access token object from passed values
	    token_hash = { :oauth_token => oauth_token, :oauth_token_secret => oauth_token_secret }
	    access_token = OAuth::AccessToken.from_hash(consumer, token_hash )
	 
	    return access_token
	end
	 
	
end