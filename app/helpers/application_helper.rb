module ApplicationHelper
  
  def create_page_title
    return "WarehouseApp | #{@page_title}" if !@page_title.nil?
  end
    
  def show_flash(message, type)
    if flash[:notice] || flash[:success] || flash[:error]
      return content_tag :div, message.html_safe, :class => "alert alert-#{type}" if message
    end
  end

  def show_msg(message, type)
    return content_tag :div, message.html_safe, :class => "alert alert-#{type}" if message
  end

  def is_session_expired?
    return User.session_expired(session[:expire])
  end

  def flash_session_expired
    return session[:expire] = session[:user] = nil 
  end
end