module ApplicationHelper
	def clp_format(num)
		number_to_currency(num, unit: 'CLP$ ', delimiter: '.', seperator: ',', precision: 0)
	end
end
