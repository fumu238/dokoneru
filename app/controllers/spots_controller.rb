class SpotsController < ApplicationController

	before_action :access, only:[:new, :edit]

	def index
		@spot = Spot.all.reverse_order
	end

	def show
		@spot = Spot.find(params[:id])
		@spot_user = @spot.user
		@post_comment = PostComment.new
		@spot.post_comments.reverse_order
	end

	def new
		@spot = Spot.new
		@area = Area.all
		@prefecture = Prefecture.all
	end

	def create
		@spot = Spot.new(spot_params)
		@spot.user_id = current_user.id
		if @spot.save
			@spot.user.spot_count += 1
			@spot.user.save
		redirect_to spot_path(@spot)
		else
		@area = Area.all
		@prefecture = Prefecture.all
		flash[:danger] = "必須項目を入力しましたか?"
		render new_spot_path
		end
	end

	def edit
		@spot = Spot.find(params[:id])
		@area = Area.all
		@prefecture = Prefecture.all
	end

	def update
		spot = Spot.find(params[:id])
		spot.update(spot_params)
		redirect_to spot_path(spot)
	end

	def destroy
		spot = Spot.find(params[:id])
		spot.destroy
	    spot.user.spot_count -= 1
	    spot.user.save
		redirect_to root_path
	end

	def search
			# if params[:q].present?
		 #  	@words = params[:q][:spot_name_or_spot_address_or_type_or_area_area_name_or_prefecture_prefecture_name_cont]
		 #    params[:q][:groupings] = []
		 #    @words.split(/[ 　]/).each_with_index do |word, i|
		 #      params[:q][:groupings][i] = { spot_name_or_spot_address_or_type_or_area_area_name_or_prefecture_prefecture_name_cont: word }
		 #    end
		 #    @words = @words.split(" ")
		 #  end

		  #  @words = params[:q][:spot_name_or_spot_address_or_type_or_area_area_name_or_prefecture_prefecture_name_cont]if params[:q].present?
		  # if @words.present?
		  #   params[:q][:groupings] = []
		  #   @words.split(/[ 　]/).each_with_index do |word, i|
		  #     params[:q][:groupings][i] = { spot_name_or_spot_address_or_type_or_area_area_name_or_prefecture_prefecture_name_cont: word }
		  #   end
		  #   @search_words = @words.to_s
		  #   binding.pry
		  # end

		  # binding.pry

	    words = params[:q].delete(:spot_name_or_spot_address_or_type_or_area_area_name_or_prefecture_prefecture_name_cont) if params[:q].present?
		  if words.present?
		    params[:q][:g] = []
		    @search_words = words.split(/[ 　]/)
		    @search_words.each_with_index do |word, i|
		      params[:q][:g][i] = { spot_name_or_spot_address_or_type_or_area_area_name_or_prefecture_prefecture_name_cont: word }
		    end
		  end
		@q = Spot.ransack(params[:q])
		@spots = @q.result(distinct: true).page(params[:page]).per(10)
	end

	private
	def spot_params
		params.require(:spot).permit(:spot_name, :spot_address, :discription, :type, :rest_area, :pavilion,
									:watar, :toilet, :roof, :prefecture_id, :area_id, :user_id)
	end

	def access
		unless user_signed_in?
			redirect_to new_user_session_path
			flash[:danger] = "ユーザー登録、またはログインをしてください"
		end
	end
end
