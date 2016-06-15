class RatingsController < ApplicationController

	before_action :authenticate_user!, only: [:create]

	def create
		rating = Rating.new
		rating.user = current_user
		rating.resource_type = params[:rating][:resource_type]
		rating.resource_id = params[:rating][:resource_id]
		rating.grade = params[:rating][:grade]
		if rating.save
			render json: {status: 200, new_rating: cal_new_rating(rating.resource_type, rating.resource_id)}
		else
			render json: {status: 400}
		end

	end

	private

	def rating_params
      params.require(:rating).permit(:grade, :resource_id, :resource_type,)
    end

    def cal_new_rating(resource_type, resource_id)
    	new_rating = 0
    	if(resource_type == :league or resource_type == 'league')
    		new_rating = League.find(resource_id).my_rating
    	elsif resource_type == :cup or resource_type == 'cup'
    		new_rating = Cup.find(resource_id).my_rating
    	end
    	return new_rating

    end
end
