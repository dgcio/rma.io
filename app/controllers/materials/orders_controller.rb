class Materials::OrdersController < ApplicationController
  def index
    @orders = Orders.all
  end

  def new
    @orders = Orders.new
  end

  def create
    @orders = Order.new(params[:orders])
  end

  def edit
    @orders = Order.find(params[:id])
  end

  def show
    @orders = Order.find(params[:id])
  end

  def destroy
    @orders = Order.find(params[:id])
  end
end