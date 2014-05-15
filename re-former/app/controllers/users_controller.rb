class UsersController < ApplicationController


	def create 
		#@user=User.new(:username=>params[:username],:password=>params[:password],:email=>params[:email]);
		@user=User.new(user_params)
		if @user.save
			redirect_to new_user_path
		else
			render :new
		end
	end

	def new
		@user=User.new
	end

	def edit
		@user =User.find_by_id(params[:id])
	end

	def user_params
		params.require(:user).permit(:username,:password,:email)
	end

	def update
		@user=User.find_by_id(params[:id])
		if @user.update(user_params)
			redirect_to new_user_path
		else
			render :new
		end
	end
end
