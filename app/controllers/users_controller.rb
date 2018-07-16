class UsersController < ApplicationController

	def index
		@user = User.all
	end

	def show
		@user = User.find(params[:id])
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		user = User.find(params[:id])
		user.update(user_params)
		redirect_to user_path
	end

	def favorites
	end

	def slepts
	end

	private
	  def user_params
	  	params.require(:user).permit(:user_name,:user_name, :name_phonetic, :nick_name, :introduction,
	  		:sex, :age, :profile_image, :background_image, :introduction)
	  end

end
