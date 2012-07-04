class ApplicationController < ActionController::Base
  before_filter :authorize
  protect_from_forgery

  private

    def authorize
      unless User.find_by_id(session[:user_id])
        redirect_to login_url, notice: 'Please Log the fuck in!'
      end
    end

  	def current_cart
  		Cart.find(session[:cart_id])
  	rescue ActiveRecord::RecordNotFound
  		cart = Cart.create
  		session[:cart_id] = cart.id
  		cart
  	end

  	def current_count
  		if session[:counter].nil?
  			session[:counter] = 1
  		else
  			session[:counter] += 1
  		end
  	end
end
