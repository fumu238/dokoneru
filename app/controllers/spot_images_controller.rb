class SpotImagesController < ApplicationController

	def new
		@spot_image = SpotImage.new
		@spot = Spot.find(params[:spot_id])
	end

	def create
		spot_image = SpotImage.new(spot_image_params)
		spot = Spot.find(params[:spot_id])
		spot_image.spot_id = spot.id
	    if spot_image.save
		redirect_to new_spot_spot_image_path(spot)
		else
		flash[:danger] = "写真を選びましたか？"
		redirect_to new_spot_spot_image_path(spot)
		end
	end

	def destroy
		spot_image = SpotImage.find_by(spot_id: params[:spot_id],id: params[:id] )
		spot_image.destroy
		spot = Spot.find(params[:spot_id])
		redirect_to new_spot_spot_image_path(spot)
	end

	private
	 def spot_image_params
		params.require(:spot_image).permit(:image, :image_discription, :spot_id )
	end
end
