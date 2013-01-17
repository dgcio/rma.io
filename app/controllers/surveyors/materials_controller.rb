class Surveyors::MaterialsController < ApplicationController
  before_filter :check_admin_and_logged_in, :only => %w[new edit]

  def index
    @materials = Materials.all
  end

  def new
    @materials = Materials.new
  end

  def create
    @materials = Materials.new(params[:materials])

    if request.post?
      if @materials.save
        redirect_to surveyors_path, :notice => "Succesfully added materials record."
      else
        render :action => :new
      end
    end
  end

  def edit
    @materials = Materials.find(params[:id])
  end

  def update 
    @materials = Materials.find(params[:id])

    if request.put?
      if @materials.update_attributes(params[:materials])
        redirect_to surveyors_path
      else
        render :action => :edit
      end
    end
  end

  def show
    @materials = Materials.find(params[:id])
  end

  def destroy
    @materials = Materials.find(params[:id])
    @materials.destroy

    redirect_to surveyors_path, :head => :ok
  end

  protected

  def check_admin_and_logged_in
    @admin = @logged_in = true
  end
end
