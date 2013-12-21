class UsersController < ApplicationController
	before_action :signed_in_user, only: [:edit, :update]
	before_action :correct_user, only: [:edit, :update]

	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
	end

	def new
		@user = User.new
	end

	def edit
		#@user = User.find(params[:id])
	end

	def create
		@user = User.new(user_params)
		if @user.save
			sign_in @user
			flash[:success] = "欢迎加入"
			redirect_to @user
		else
			render 'new'
		end
	end

	def update
		#@user = User.find(params[:id])
		if @user.update_attributes(user_params)
			flash[:success] = "Profile updated"
			redirect_to @user
		else
			render 'edit'
		end
	end

	def destroy
		sign_out
		redirect_to root_path
	end
	
	private
	def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation)
	end

	def signed_in_user
		unless signed_in_user
			store_location
			redirect_to signin_url, notice: "请先登录"
		end
	end

	def correct_user
		@user = User.find(params[:id])
		redirect_to(root_path) unless current_user?(@user)
	end
end
