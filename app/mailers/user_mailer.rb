class UserMailer < ActionMailer::Base
  default from: "noreply@warehouseapp.net"

  def signup_confirmation(user)
  	@user = user
  	@greeting = 'Welcome to WarehouseApp.net, #{@user.name}'

  	mail to: @user.email, subject: @greeting
	end
end