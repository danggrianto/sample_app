class SessionsController < ApplicationController
	def new		
		# signin
	end

	def create
		# create new session
		user = User.find_by_email(params[:email].downcase)
		if(user && user.authenticate(params[:password]))
			session[:user] = user.id
			sign_in user
			redirect_back_or user
		else
			# create error
			flash.now[:error] = "Invalid email/password combinaion"
			render 'new'
		end

	end

	def destroy
		sign_out
		redirect_to root_url
	end
end
