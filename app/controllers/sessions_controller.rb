class SessionsController < ApplicationController
  def new
  end

  def create

    auth = request.env['omniauth.auth']
    # byebug
	user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth) 
	session[:user_id] = user.id
	redirect_to root_url, :notice => "signed in"

  	  # session[:name] = auth["info"]["name"]
    #   session[:token] = auth["credentials"]["token"]
    #   session[:token_secret] = auth["credentials"]["secret"]
  	 #  
  end

  def failure
  end
  
end
