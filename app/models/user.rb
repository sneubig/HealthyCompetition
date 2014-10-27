require 'figaro'

class User < ActiveRecord::Base

	def init
		# Instantiate the Choreo, using a previously instantiated TembooSession object, eg:
		# session = TembooSession.new("sneubig", "myFirstApp", "883113ff303e481cbdf8762158df9793")
		finalizeOAuthChoreo = Fitbit::OAuth::FinalizeOAuth.new(session)

		# Get an InputSet object for the choreo
		finalizeOAuthInputs = finalizeOAuthChoreo.new_input_set()

		# Set inputs
		finalizeOAuthInputs.set_CallbackID(ENV["FITBIT_CALLBACK_ID"]);
		finalizeOAuthInputs.set_OAuthTokenSecret(ENV["FITBIT_ACCESS_TOKEN_SECRET"]);
		finalizeOAuthInputs.set_ConsumerSecret(ENV["FITBIT_CONSUMER_SECRET"]);
		finalizeOAuthInputs.set_ConsumerKey(ENV["FITBIT_CONSUMER_KEY"]);

		# Execute Choreo
		finalizeOAuthResults = finalizeOAuthChoreo.execute(finalizeOAuthInputs)
	end
end