require 'httparty'
require 'oauth'
 
headers = {
  :oauth_consumer_key => 'ec56b57fd3034d9bbe6c27bb4835546f',
  :oauth_token => '31632a2e0761fee574a353dfdf1466ad',
  :oauth_token_secret => '6c9b616eb9ed72c078d94b81ebd707f2',
}
 
# Exchange your oauth_token and oauth_token_secret for an AccessToken instance.
def prepare_access_token(oauth_token, oauth_token_secret)
    consumer = OAuth::Consumer.new("ec56b57fd3034d9bbe6c27bb4835546f", "91e174c9818d4696bf34d9213c508cc0", 
    { :site => "https://api.fitbit.com", :scheme => :header })
     
    # now create the access token object from passed values
    token_hash = { :oauth_token => oauth_token, :oauth_token_secret => oauth_token_secret }
    access_token = OAuth::AccessToken.from_hash(consumer, token_hash )
 
    return access_token
end
 
# Exchange our oauth_token and oauth_token secret for the AccessToken instance.
access_token = prepare_access_token(headers[:oauth_token], headers[:oauth_token_secret])
 
# use the access token as an agent to get the home timeline
response = access_token.request(:get, "https://api.fitbit.com/1/user/-/activities/goals/weekly.json")
puts response.body