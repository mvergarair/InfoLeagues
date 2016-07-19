class PagesController < ApplicationController

	def welcome
		if not browser.device.mobile?
			redirect_to leagues_path and return
		end		
	end
end
