# frozen_string_literal: true

class ItemsController < ApplicationController
  before_action :set_item, only: %i[show edit update destroy]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
    @uploaded_items = []
  end

  def edit; end

  def create
    params[:item][:remaining_quantity] = params[:item][:quantity]
    @item = Item.new(item_params)
    if @item.save
      redirect_to items_path, notice: 'Item was successfully created.'
    else
      render :new
    end
  end

  def update
    if @item.update(item_params)
      redirect_to items_path, notice: 'Item was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to items_url, notice: 'Item was successfully destroyed.'
  end

  def import
    if params[:file].present?
      @uploaded_items = Item.import(params[:file])
      if @uploaded_items.any?
        redirect_to new_item_path, notice: 'Items were successfully imported.'
      else
        redirect_to new_item_path, alert: 'No valid items found in the file.'
      end
    else
      redirect_to new_item_path, alert: 'Please upload a file.'
    end
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :category, :quantity, :description, :serial_number, :purchased_on,
                                 :purchased_price, :remaining_quantity)
  end
end
