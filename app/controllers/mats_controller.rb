class MatsController < ApplicationController
   before_filter :check_admin_and_logged_in, :only => %w[new edit]
  # GET /mats
  # GET /mats.json
  def index
    @mats = Mat.where(:department => params[:department])
  end

  # GET /mats/1
  # GET /mats/1.json
  def show
    @mat = Mat.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @mat }
    end
  end

  # GET /mats/new
  # GET /mats/new.json
  def new
    @mat = Mat.new

    render :layout => false
  end

  # GET /mats/1/edit
  def edit
    @mat = Mat.find(params[:id])
    render :layout => false
  end

  # POST /mats
  # POST /mats.json
  def create
    @mat = Mat.new(params[:mat])
    @mat.department = params[:department]

    respond_to do |format|
      if @mat.save
        format.html { redirect_to mats_path(params[:department]), notice: 'Materials successfully created.' }
        format.json { render json: @mat, status: :created, location: @mat }
      else
        format.html { render action: "new" }
        format.json { render json: @mat.errors, status: :unprocessable_entity }
      end 
    end
  end

  # PUT /mats/1
  # PUT /mats/1.json
  def update
    @mat = Mat.find(params[:id])
    @department = @mat.department

    respond_to do |format|
      if @mat.update_attributes(params[:mat])
        format.html { redirect_to mats_path(@department), notice: 'Mat was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @mat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mats/1
  # DELETE /mats/1.json
  def destroy
    @mat = Mat.find(params[:id])
    @mat.destroy

    respond_to do |format|
      format.html { redirect_to mats_url }
      format.json { head :no_content }
    end
  end

  protected 

  def check_admin_and_logged_in
    @admin = @logged_in = true
  end 
end

