class LeaguesController < ApplicationController

	autocomplete :league, :name, full: true, limit: 10, extra_data: [:phone]

	def index
		@leagues = League.all
		@rating = Rating.new

		#day filter
		if not (params[:day] == nil or params[:day] == '')
			@leagues = @leagues.where(id: Cup.where(day: day_array(params[:day].split(','))).map{|cup| cup.league.id})
			# @leagues = @leagues.joins(:cups).where('cups.day in ?' , day_array(params[:day].split(','))  )
		end

		#county sector filter
		if params[:county] and params[:county] != ''
			@leagues = @leagues.where(county: County.where(name: params[:county].split(',')))
		end

		#amount of players filter
		if not (params[:amount_of_players] == nil or params[:amount_of_players] == '')
			@leagues = @leagues.where(id: Cup.where(amount_of_players: params[:amount_of_players].split(',')).map{|cup| cup.league.id})
		end

		#price filter
		if params[:price] != nil and params[:price] != ''
			@leagues = @leagues.where('min_price <= ?' , params[:price].to_i )
		end

		#name filter
		if not (params[:search] == '' or params[:search] == nil)
			@leagues = @leagues.where( name: params[:search])
		end

		limit = 2 ;

		@leagues = @leagues.limit(2).offset(2*(params[:page] ? params[:page].to_i - 1 : 0));
		@page = params[:page]
		@pages_num = (@leagues.count/limit).to_i + 1


		@leagues = @leagues.sort_by{ |league| league.uses_liga_fc ? 0 : 1 }


	end

	def twitter_search
		client = Twitter::REST::Client.new do |config|
		  config.consumer_key        = "fMN930mkDWpHMqowi6EYV9DaI"
		  config.consumer_secret     = "C1UbBGnGuGWjj8sTRlIP70sYR0x5vLmk81JYXRFtwrrKtxaNzU"
		  config.access_token        = "296286425-HA1vzbt35Gxn7mzRdbhcFxmD42Saanzl41B4GPaB"
		  config.access_token_secret = "XTIKGWdT1Fto6hin1wT0ITgPX2lZKmK8KbfJ1Rhj2biHr"
		end

		search = client.user_search(params[:query]) 
		render json: search
	end

	def day_array (array)
		return_array = []
		array.each do |day|
			return_array << Cup.days[day]
		end
		return return_array
	end

end
