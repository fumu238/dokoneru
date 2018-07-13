class SpotsController < ApplicationController

	def index
	end

	def show
		@spot = Spot.find_by(params[:spot_name])
	end

	def new
		@spot = Spot.new
		@area = Area.all
		@prefecture = Prefecture.all
	end

	def create
		spot = Spot.new(spot_params)
		user.id = current_user.id
		spot.save
	end

	def edit
		@spot = Spot.find_by(params[:spot_name])
	end

	def update
		spot = Spot.find_by(params[:spot_name])
		spot.update
	end

	def destroy
		spot = Spot.find_by(params[:spot_name])
		spot.destroy
	end

	def search
	end

	private
	def spot_params
		params.require(:spot).permit(:spot_name, :spot_address, :discription, :type,
									:watar, :toilet, :roof, :prefecture_id, :area_id)
	end

end
