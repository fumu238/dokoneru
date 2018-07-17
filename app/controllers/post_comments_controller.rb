class PostCommentsController < ApplicationController

	def create
		spot = Spot.find(params[:spot_id])
		comment = current_user.post_comments.new(post_comment_params)
		comment.spot_id = spot.id
		comment.save
		redirect_to spot_path(spot)
	end

	def destroy
		spot = Spot.find(params[:spot_id])
		comment = PostComment.find_by(params[:post_comment_id])
		comment.destroy
		redirect_to spot_path(spot)
	end

	private
		def post_comment_params
		  params.require(:post_comment).permit(:user_id,:spot_id,:comment)
		end
end
