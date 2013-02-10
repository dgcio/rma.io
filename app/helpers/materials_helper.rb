module MaterialsHelper

	def is_stock_low(stock_level)
		if stock_level <= 1
			return " error"
		end
	end

  def valid_department
  	return ["installers", "surveyors", "dealers"].include? params[:department]
  end
end
