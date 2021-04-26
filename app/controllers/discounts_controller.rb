class DiscountsController < ApplicationController

  def index
    @merchant = Merchant.find(params[:merchant_id])
    @discounts = @merchant.discounts
    @three_holidays = @discounts##

    # @merchant = Merchant.find(params[:merchant_id])
    # @enabled_items = Item.all.enabled
    # @disabled_items = Item.all.disabled
    # @top_items = Item.top_five_items(@merchant.id)
    # @top_days = @top_items.map {|item| item.item_best_day.first}
  end

  def show
    @discount = Discount.find(params[:id])

    # @item = Item.find(params[:id])
    # @merchant = @item.merchant
  end

  def create
    @merchant = Merchant.find(params[:merchant_id])
    discount = @merchant.discounts.new({percent: params[:percent], quantity: params[:quantity]})
    if discount.save
      redirect_to "/merchants/#{@merchant.id}/discounts"
    else
      flash[:alert] = "ERROR: Please enter percentage & quantity"
      redirect_to "/merchants/#{@merchant.id}/discounts/new"
    end
  end

  def new
    @merchant = Merchant.find(params[:merchant_id])
  end
# <%= form_with url:"/merchants/#{@merchant.id}/discounts", method: :post, local: true do |form| %>


  def edit
    @discount = Discount.find(params[:id])
    @merchant = @discount.merchant
  end

  def update
    discount = Discount.find(params[:id])
    @merchant = discount.merchant
    # if params[:name]
      discount.update({
        percent: params[:percent],
        quantity: params[:quantity]
        })
    # else
    #   item.update({able: params[:able]})
    # end
    if discount.save
      flash[:notice] = "Item was successfully updated."
      redirect_to "/merchants/#{@merchant.id}/discounts"
    else
      flash[:alert] = "ERROR: Item not updated."
      redirect_to "/merchants/#{@merchant.id}/discounts/#{discount.id}/edit"
    end
  end
end
