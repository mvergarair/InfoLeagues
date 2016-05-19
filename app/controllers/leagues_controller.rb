class LeaguesController < ApplicationController

	autocomplete :league, :name, full: true, limit: 10, extra_data: [:phone]

	def index
		@leagues = League.all

		if params[:search]
			@leagues = @leagues.where( name: params[:search])
		end

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
end
