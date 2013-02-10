class UsersController < ApplicationController
  
  def index
    @page_title = "Index"
  end
  
  def login
    @page_title = "Login"
    @redirect = request.base_url + params[:r] if params[:r].to_s.include? "/"

    if request.post?
      session[:user] = User.authenticate(params[:users][:email], params[:users][:password])
      if session[:user]
        session[:expire] = 16.hours.from_now
        if @redirect
          redirect_to @redirect
        else
          redirect_to user_index_path
        end
      else
        flash[:error] = "Invalid Username and/or Password, please try again."
        render :action => "login", :r => @redirect
      end
    end
  end
  
  def register
    @page_title = "Register"
    @user = User.new
  end

  def create
    redirect_to register_path if params[:user].blank?
    @user = User.new(params[:user])
    
    if request.post?
      if @user.save
        UserMailer.signup_confirmation(@user).deliver
        redirect_to login_path, :notice => "Thank you, " + @user.email + " you may login below."
      else
        render :action => :register
      end
    end
  end

  def destroy
    if session[:user]
      session[:user] = session[:expire] = nil
      redirect_to root_path, :notice => "You've been logged out."
    else 
      redirect_to root_path, :notice => "You're not logged in."  
    end
  end
  
end