class InventorysController < ApplicationController
  # GET /Inventorys
  # GET /Inventorys.json
  def index
    @inventory = Inventory.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @inventory }
    end
  end

  # GET /Inventorys/1
  # GET /Inventorys/1.json
  def show
    @inventory = Inventory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @inventory }
    end
  end

  # GET /Inventorys/new
  # GET /Inventorys/new.json
  def new
    @inventory = Inventory.new

    render :layout => false
  end

  # GET /Inventorys/1/edit
  def edit
    @inventory = Inventory.find(params[:id])
    render :layout => false
  end

  # Inventory /Inventorys
  # Inventory /Inventorys.json
  def create
    @inventory = Inventory.new(params[:Inventory])

    respond_to do |format|
      if @inventory.save
        format.html { redirect_to Inventorys_path, notice: 'Inventory was successfully created.' }
        format.json { render json: @inventory, status: :created, location: @inventory }
      else
        format.html { render action: "new" }
        format.json { render json: @inventory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /Inventorys/1
  # PUT /Inventorys/1.json
  def update
    @inventory = Inventory.find(params[:id])

    respond_to do |format|
      if @inventory.update_attributes(params[:Inventory])
        format.html { redirect_to Inventorys_path, notice: 'Inventory was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @inventory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /Inventorys/1
  # DELETE /Inventorys/1.json
  def destroy
    @inventory = Inventory.find(params[:id])
    @inventory.destroy

    respond_to do |format|
      format.html { redirect_to inventories_url }
      format.json { head :no_content }
    end
  end
end
