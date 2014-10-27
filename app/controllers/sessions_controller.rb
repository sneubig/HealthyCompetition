class SessionsController < ApplicationController
  def new
  end

  def create

    auth_hash = request.env['omniauth.auth']
    user = User.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"])
  	  session["user"] = auth_hash["info"]["name"]
  	  if @authorization
    	render :text => "Welcome back #{user.name}! You have already signed up."
  	  else
	      user = User.new :name => auth_hash["info"]["name"]
	      user.authorizations.build :provider => auth_hash["provider"], :uid => auth_hash["uid"]
	      user.save
 
    	  render :text => "Hi #{user.name}! You've signed up."
	  end
    end
  # def create
  #   auth = request.env["omniauth.auth"]     
  #   user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)     
  #   session[:user_id] = user.id     
  #   session[:token] = auth["credentials"]["token"]
  #   session[:tokensecret] = auth["credentials"]["secret"]
  #   session[:user_name] = auth["extra"]["raw_info"]["username"]
  #   redirect_to '/'+ session[:user_name], :notice => "Signed in!"
  # end

  def failure
  end
end
