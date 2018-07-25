class UsersController < ApplicationController
	before_action :authenticate_user!, only:[:index, :slepts, :favorites]
	# layout "user_index", only: [:index]
	def index
		@user_search = User.ransack(params[:user], search_key: :user)
		@users = @user_search.result(distinct: true).page(params[:page]).per(5)
	end

	def delete_flag
		user = User.find(params[:id])
		user.update(delete_flag: "true")
		redirect_to users_path
	end

	def return
		user = User.find(params[:id])
		user.update(delete_flag: "false")
		redirect_to users_path
	end

	def show
		@user = User.find(params[:id])

		@hokkaidof = 0
		@tohokuf = 0
		@kantof = 0
		@hokurikuf = 0
		@tokaif = 0
		@kansaif = 0
		@chugokuf = 0
		@sikokuf = 0
		@kyushuf = 0
		
		@user.favorites.each do |f|
			if f.spot.area_id == 1
				@hokkaidof += 1
			elsif
				f.spot.area_id == 2
				@tohokuf += 1
			elsif
				f.spot.area_id == 3
				@kantof += 1
			elsif
				f.spot.area_id == 4
				@hokurikuf += 1
			elsif
				f.spot.area_id == 5
				@tokaif += 1
			elsif
				f.spot.area_id == 6
				@kansaif += 1
			elsif
				f.spot.area_id == 7
				@chugokuf += 1
			elsif
				f.spot.area_id == 8
				@sikokuf += 1
			elsif
				f.spot.area_id == 9
				@kyushuf += 1
			end
		end

		@hokkaidos = 0
		@tohokus = 0
		@kantos = 0
		@hokurikus = 0
		@tokais = 0
		@kansais = 0
		@chugokus = 0
		@sikokus = 0
		@kyushus = 0

		@user.slepts.each do |s|
			if s.spot.area_id == 1
				@hokkaidos += 1
			elsif
				s.spot.area_id == 2
				@tohokus += 1
			elsif
				s.spot.area_id == 3
				@kantos += 1
			elsif
				s.spot.area_id == 4
				@hokurikus += 1
			elsif
				s.spot.area_id == 5
				@tokais += 1
			elsif
				s.spot.area_id == 6
				@kansais += 1
			elsif
				s.spot.area_id == 7
				@chugokus += 1
			elsif
				s.spot.area_id == 8
				@sikokus += 1
			elsif
				s.spot.area_id == 9
				@kyushus += 1
			end
		end
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
		@user = User.find(params[:user_id])
		# @favorites = Favorite.where(params[:user_id]).page(params[:page]).per(5).order("created_at DESC")
		@spots = @user.favorites.page(params[:page]).per(1).order("created_at DESC")
	end

	def slepts
		@user = User.find(params[:user_id])
		# @slepts = @user.slepts.page(params[:page]).per(5).order("created_at DESC")
		@spots = @user.slepts.page(params[:page]).per(1).order("created_at DESC")

	end

	private
	  def user_params
	  	params.require(:user).permit(:user_name,:user_name, :name_phonetic, :nick_name, :introduction,
	  		:sex, :age, :profile_image, :background_image, :introduction, :prefecture_id)
	  end

end
