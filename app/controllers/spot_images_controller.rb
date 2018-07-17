class SpotImagesController < ApplicationController

	def new
		@spot_image = SpotImage.new
	end

	def create
		spot_image = SpotImage.new(spot_image_params)
		spot = Spot.find(params[:spot_id])
		spot_image.spot_id = spot.id
		spot_image.save
		redirect_to spot_path(spot.id)
	end

	def destroy
	end

	private
	 def spot_image_params
		params.require(:spot_image).permit(:image, :image_discription, :spot_id)
	end
end
