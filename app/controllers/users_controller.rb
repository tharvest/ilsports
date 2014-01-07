class UsersController < ApplicationController
	before_action :signed_in_user, only: [:index, :edit, :update]
	before_action :correct_user,	only: [:edit, :update]
	before_action :admin_user,		only: :destroy

	def index
		@users = User.paginate(page: params[:page])
	end

	def show
		begin
			@user = User.find(params[:id])
		rescue ActiveRecord::RecordNotFound 
			logger.error "试图访问无效的用户#{params[:id]}"
			redirect_to root_url, :notice => '访问的用户不存在'
		else
			respond_to do |format|
				format.html # show.html.erb
			end
		end
	end

	def new
		@user = User.new
	end

	def edit
		@user = User.find(params[:id])
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
		@user = User.find(params[:id])
		if @user.update_attributes(user_params)
			flash[:success] = "Profile updated"
			redirect_to @user
		else
			render 'edit'
		end
	end

	def destroy
		User.find(params[:id]).destroy
		flash[:success] = "完成用户删除"
		redirect_to users_url
	end
	
	private
	def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation)
	end

	def signed_in_user
		unless signed_in?
			store_location
			redirect_to signin_url, notice: "请先登录"
		end
	end

	def correct_user
		@user = User.find(params[:id])
		redirect_to(root_path) unless current_user?(@user)
	end
	def admin_user
		redirect_to(root_path) unless current_user.admin?
	end

end
