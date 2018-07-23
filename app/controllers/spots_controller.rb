class SpotsController < ApplicationController

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
		spot = Spot.new(spot_params)
		spot.user_id = current_user.id
		spot.save
		redirect_to spot_path(spot)
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
		redirect_to root_path
	end

	def search
		 groupings =[]
	    if params[:q].present?
	    	@words = params[:q][:spot_name_or_spot_address_or_type_or_area_area_name_or_prefecture_prefecture_name_cont].split(/[\p{blank}\s]+/)
	    	@words.each { |value| groupings.push(spot_name_or_spot_address_or_type_or_area_area_name_or_prefecture_prefecture_name_cont: value) }
	    end
	    @q = Spot.ransack(
		       combinator: 'or',
		       groupings: groupings
		   )
	    @spots = @q.result(distinct: true).page(params[:page]).per(2)
		# @q = Spot.ransack(params[:q])
	   #  @words = params[:q].delete(:spot_name_or_spot_address_or_area_area_name_or_prefecture_prefecture_name_cont) if params[:q].present?
		  # if @words.present?
		  #   params[:q][:groupings] = []
		  #   @words.split(/[ 　]/).each_with_index do |word, i|
		  #     params[:q][:groupings][i] = { spot_name_or_spot_address_or_area_area_name_or_prefecture_prefecture_name_cont: word }
		  #   end
		  # end
	end

	private
	def spot_params
		params.require(:spot).permit(:spot_name, :spot_address, :discription, :type, :rest_area, :pavilion,
									:watar, :toilet, :roof, :prefecture_id, :area_id, :user_id)
	end
end
