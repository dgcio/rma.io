module CarriagesHelper 
  def carriage_model
    return nil if params[:q].nil?
    m = params[:q].to(3)
    case m
      when "1101" then "A120"
      when "1104" then "B80"
    end 
  end
  
  def carriage_orientation
    return nil if params[:q].nil?
    m = params[:q].to(5).reverse.to(0)
    case m
      when "1" then "LH"
      when "2" then "RH"
    end 
  end

  def carriage_type
    return "Indoor;Outdoor;Curve;Perch".split(";")
  end

  def carriage_status
    return "In_Repair;Awaiting_Inspection;New;Scrap;Quarantine".split(";")
  end

  def carriage_nil?
    return true if @barcode.to_s.length > 12 || !params[:q].blank? && @barcode.blank? && params[:q].to_s.length <= 12
  end

end
