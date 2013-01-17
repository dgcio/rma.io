class CarriagesController < ApplicationController
  before_filter :find_carriage, :only => %w[view edit update destroy]
  before_filter :check_admin_and_logged_in, :only => %w[index bardcode position new view]

  def index 
    @carriages = Carriage.all
    @carriages_position = Carriage.order("warehouse_point ASC").map(&:warehouse_point).uniq 
  end
  
  def barcode
    @page_title = "Scan"
    @barcode = params[:q].split('-').reverse.delete_at(1) if !params[:q].blank?
    @uniq = Carriage.find_by_serial(@barcode)
  end
  
  def position
    @carriage = Carriage.find_by_warehouse_point(:warehouse_point)
  end

  def new
    @page_title = "Create"
    @carriage = Carriage.new
    @barcode = params[:q].split('-').reverse.delete_at(1) if !params[:q].blank?
  end

  def create
    @carriage = Carriage.new(params[:carriage])

    if request.post?
      if @carriage.save
        redirect_to carriage_show_path(@carriage.serial), :notice => "Carriage succesfully created"
      else
        render :action => :new
      end
    end
  end
  
  def view
    @page_title = "View ##{@carriage.serial}"
  end

  def edit
    @page_title = ":edit => {:serial => #{@carriage.serial}}"
  end

  def update
    if @carriage.update_attributes(params[:carriage])
      redirect_to carriage_show_path(@carriage.serial), :notice => 'Carriage was successfully updated.'
    else
      render :action => :edit
    end
  end

  def destroy
    @carriage.destroy 
    redirect_to carriage_path, :head => :ok
  end

  protected

  def find_carriage
    @carriage = Carriage.find_by_serial(params[:serial])
  end 

  def check_admin_and_logged_in
    @admin = @logged_in = true
  end    
end