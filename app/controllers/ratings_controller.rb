class RatingsController < ApplicationController

	before_action :authenticate_user!, only: [:create]

	def create
		rating = Rating.new
		rating.user = current_user
		rating.resource_type = params[:rating][:resource_type]
		rating.resource_id = params[:rating][:resource_id]
		rating.grade = params[:rating][:grade]
		if rating.save
			render json: {status: 200, league_info: get_new_info(rating.resource_type, rating.resource_id), }
		else
			render json: {status: 400}
		end

	end

	private

	def rating_params
      params.require(:rating).permit(:grade, :resource_id, :resource_type,)
    end

    def get_new_info(resource_type, resource_id)
    	league_info = {}
    	if(resource_type == :league or resource_type == 'league')
    		league = League.find(resource_id)
    		league_info[:val] = league.my_rating
    		league_info[:league_name] = league.name
    	elsif resource_type == :cup or resource_type == 'cup'
    		cup = Cup.find(resource_id)
    		league_info[:val] = cup.my_rating
    		league_info[:league_name] = cup.league.name
    	end
    	return league_info

    end

    def league_name
    	if(resource_type == :league or resource_type == 'league')

    	elsif resource_type == :cup or resource_type == 'cup'

    	end
    end
end
