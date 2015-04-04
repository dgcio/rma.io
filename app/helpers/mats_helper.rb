module MatsHelper
	def is_stock_low(stock_level)
		if stock_level <= 1
			return " error"
		end
	end

	def valid_department
		return ["installers", "surveyors", "dealers", "partners"].include? params[:department]
	end

	def active_tab(department)
		if params[:department] == department 
		  return 'class="active"'.html_safe
		end
	end

	def format_date(date)
		d = date
		return d.strftime("%m/%d/%Y @ %I:%M%p")
	end
end

