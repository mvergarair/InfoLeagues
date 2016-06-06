module LeaguesHelper

	def initial_letter_day(day_number)
		case day_number
		when 0
			"L"
		when 1
			"M"
		when 2
			"W"
		when 3
			"J"
		when 4
			"V"
		when 5
			"S"
		when 6
			"D"
		end
	end

	def standerdize_url (url)
		if  (url[0..3] != 'http')
			if url[0..2] == 'www'
				return "http://" + url
			end
			return "http://www." + url
		end
		return url
	end
end
