class MaterialsController < ApplicationController
	before_filter :check_logged_in, :only => :index

  def index
  	@inventory = Inventory.where(:department => params[:department])
  end

  protected

  def check_logged_in
  	@logged_in = true
  end
end
