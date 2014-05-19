class SessionsController < ApplicationController
	def new
		@user=User.new
	end

	def create
		user=User.find_by(email: params[:session][:email].downcase)
		if user&&user.authenticate(params[:session][:password])
			puts "inside create save"
			redirect_to new_session_path
		else
			flash[:error]='Invalid 	email/password combination'
			puts @user.errors.messages
 			render :new
		end 
		
	end

	private
	def user_params
		params.require(:session).permit(:username,:password,:password_confirmation,:email)
	end
end