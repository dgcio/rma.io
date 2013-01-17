class SerialNumberGen
  
  def generate_serial(serial_start, table_name, wh_pos) 
    r = Random.new()
    start_time = t = Time.new() 
    
    static_start = ["360", "426", "217", "346"]
    
    static_start.each do |n|

      model = case serial_start
        when "1101" then model = "A120"
        when "1401" then model = "A120_Seat"
        when "1104" then model = "A80"
        when "1200" then model = "Rail"
        else model = "Invalid"
      end
      
      0.upto(1) {
        
        orie = r.rand(1..2)
          
        if r.rand(3..4) == 3
          if r.rand(5..6) == 5 
            type = "Indoor"
          else
            type = "Heavy Duty"
          end
        else
          type = "Outdoor"
        end  
          
        if orie == 1
          orientation = "LH"
        else
          orientation = "RH"
        end
        print "INSERT into #{table_name} (serial,model,orientation,stype,motor,pcb,status,orderno,created_at,updated_at,warehouse_point) values('#{serial_start}0#{orie}#{n}#{r.rand(100..999)}','#{model}','#{orientation}','#{type}','000#{r.rand(1111..9999)}','#{r.rand(111111..999999)}', '#{"new"}', '#{r.rand(111111..999999)}', '#{Time.now}', '#{Time.now}', '#{wh_pos}');"
      }
    end
  end  
end

r = SerialNumberGen.new 
r.generate_serial("1104", "carriages", "A1")
r.generate_serial("1101", "carriages", "A2")
r.generate_serial("1104", "carriages", "A3")
#r.generate_serial("1101", "carriages", "B1")
# r.generate_serial("1101", "carriages", "O2")
# r.generate_serial("1101", "carriages", "L1")
# r.generate_serial("1104", "carriages", "K2")
# r.generate_serial("1104", "carriages", "P3")
