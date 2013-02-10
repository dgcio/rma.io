class Materials::InventoryController < ApplicationController
  before_filter :check_admin_and_logged_in, :only => %w[new edit]

  def index
    @inventory = Inventory.all
  end

  def new
    @inventory = Inventory.new
  end

  def create
    @inventory = Inventory.new(params[:inventory])
    @inventory.department = params[:department]

    if request.post?
      if @inventory.save
        redirect_to materials_index_path(params[:department]), :notice => "Succesfully added inventory record."
      else
        render :action => :new
      end
    end
  end

  def edit
    @inventory = Inventory.find(params[:id])
  end

  def update 
    @inventory = Inventory.find(params[:id])

    if request.put?
      if @inventory.update_attributes(params[:inventory])
        redirect_to materials_index_path(@inventory.department)
      else
        render :action => :edit
      end
    end
  end

  def show
    @inventory = Inventory.find(params[:id])
  end

  def destroy
    @inventory = Inventory.find(params[:id])
    @redirect = @inventory.department
    @inventory.destroy

    redirect_to materials_index_path(@redirect), :head => :ok
  end

  protected

  def check_admin_and_logged_in
    @admin = @logged_in = true
  end
end
