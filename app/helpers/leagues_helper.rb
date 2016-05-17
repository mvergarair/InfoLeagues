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
end
