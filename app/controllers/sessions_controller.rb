class SessionsController < ApplicationController
  def new
  end

  def create
    reset_session
    auth = request.env['omniauth.auth']
    # byebug
    # binding.pry
	  user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth) 
	  session[:user_id] = user.id
	  session[:token] = auth["credentials"]["token"]
    session[:token_secret] = auth["credentials"]["secret"]
	  redirect_to root_url, :notice => "signed in"

  
    # Exchange our oauth_token and oauth_token secret for the AccessToken instance.
	  access_token = User.prepare_access_token(session[:token] ,session[:token_secret]  )
	 
	  # use the access token as an agent to get the home timeline
	  @response = access_token.request(:get, "http://api.fitbit.com/1/user/-/activities/goals/weekly.json")  
  	@activities = access_token.request(:get, "http://api.fitbit.com/1/user/-/summary/steps.json")

  end

  def destroy
  	session[:user_id] = nil
    render :text => "You've logged out! Come back again soon!"
  end

  def failure
  	render :text => "Sorry, but you didn't allow access to our app!"
  end
  
end
