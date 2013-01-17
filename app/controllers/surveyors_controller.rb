class SurveyorsController < ApplicationController
	before_filter :check_logged_in, :only => :index

  def index
  	@materials = Materials.all
  end

  protected

  def check_logged_in
  	@logged_in = true
  end
end
