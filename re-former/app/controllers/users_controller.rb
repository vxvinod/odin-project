class UsersController < ApplicationController

	def new
	end

	def create 
		#@user=User.new(:username=>params[:username],:password=>params[:password],:email=>params[:email]);
		@user=User.new(user_params)
		if @user.save
			redirect_to new_user_path
		else
			render :new
		end
	end

	def user_params
		params.require(:user).permit(:username,:password,:email)
	end
end
