module SurveyorsHelper

	def is_stock_low(stock_level)
		if stock_level <= 1
			return "error"
		end
	end

end
