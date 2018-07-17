class PrefecturesController < ApplicationController

	def areas
	end

	def show
		@prefecture = Prefecture.find_by(prefecture_name: params[:prefecture_name])
	end
end
