class CountiesController < ApplicationController

	def index
		render json: County.all
	end

	def closest_counties
		result = request.location
		render json: result
	end
end
