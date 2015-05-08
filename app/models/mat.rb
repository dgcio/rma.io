class Mat < ActiveRecord::Base
  attr_accessible :amount_left, :amount_per_box, :artwork, :name, 
				  :wh_position, :department
  validates :amount_left, :amount_per_box, :name, :presence => true

  	def self.check_departments(dept_var, dept_required)
	    objArray = []
	    @cur_dept = dept_required
	    dept_var.each do |t|
	      split_dept = t.department.split(',')
	        if split_dept.include?(dept_required) == true then
	            if objArray == nil then
	            	objArray.push t
	            else
	          		objArray << t
	            end
	        end
	    end
		objArray.to_a
	end

	def self.arr2str_checkboxes(dept_arr)
		objArray = []
		return nil if dept_arr.blank?
		dept_arr.each do |key, department|
	  		if objArray == nil then
				objArray = [].push department.downcase
			else
				objArray << department.downcase
			end
		end
		objArray * ","
	end

	protected
	# TODO: research variable permissions^
	def self.create_arr(data)  	
		if objArray == nil then
			objArray = [].push data
		else
			objArray << data
		end
	end
end
