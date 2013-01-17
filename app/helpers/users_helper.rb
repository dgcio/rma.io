module UsersHelper
  def user
    return session[:user]
  end

  def is_logged_in?
    return user
  end

  def login_required_text
    return "Please #{link_to :login, login_path(:r => "#{request.original_fullpath}") } to continue."
  end

  def is_admin?
    return user[:admin] if is_logged_in?
  end

  def admin_required?
    return @admin
  end

  def admin_required_text
    return "You do not have permission to view this content."
  end

  def login_form_url
    if !@redirect
      return login_path
    else
      return login_path(:r => "#{params[:r]}")
    end
  end

  def center_form
    if @user.errors.any?
      return "pull-left"
    else
      return "span5"
    end
  end
end
