class SleptsController < ApplicationController

	def create
		@spot = Spot.find(params[:spot_id])
		@slept = Slept.create(user_id: current_user.id, spot_id: params[:spot_id])
		respond_to do |format|
      		format.js
    	end
	end

	def destroy
		@spot = Spot.find(params[:spot_id])
		@slept = Slept.find_by(user_id: current_user.id, spot_id: params[:spot_id])
		@slept.destroy
		respond_to do |format|
      		format.js
    	end
	end

end
