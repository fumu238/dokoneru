class FavoritesController < ApplicationController

	def create
		@spot = Spot.find(params[:spot_id])
		@favorite = Favorite.create(user_id: current_user.id, spot_id: params[:spot_id])
		respond_to do |format|
      		format.js
    	end
	end

	def destroy
		@spot = Spot.find(params[:spot_id])
		@favorite = Favorite.find_by(user_id: current_user.id, spot_id: params[:spot_id])
		@favorite.destroy
		respond_to do |format|
      		format.js
    	end
	end
end
