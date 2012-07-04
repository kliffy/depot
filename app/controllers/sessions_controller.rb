class SessionsController < ApplicationController
	skip_before_filter :authorize

  def new
  end

  def create
    if User.all.empty?
      user = User.create!(name: params[:name],
                          password: params[:password],
                          password_confirmation: params[:password])
    else
      user = User.find_by_name(params[:name])
    end
  	
  	if user and user.authenticate(params[:password])
  		session[:user_id] = user.id
  		redirect_to admin_url
  	else
  		redirect_to login_url, alert: "Invalid user/pass combo!"
  	end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to store_url, notice: 'Logged Out'
  end
end
