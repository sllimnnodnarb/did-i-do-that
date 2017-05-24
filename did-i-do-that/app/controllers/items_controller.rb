class ItemsController < ApplicationController
before_action :authenticate_user!
  def index
    @items = Item.all
  end

  def show
    @user = current_user
    @item = Item.find(params[:id])
    @items = Item.all
  end

  def new
    @user = current_user
    @item = Item.new(item_params)
    @item.user = current_user
  end

  def create
    @user = current_user
    @item = Item.new(item_params)
    @item.user = current_user

    if @item.save
      flash[:notice] = "Your to-do item has been added to the list."
      redirect_to welcome_index_path
    else
      flash.now[:alert] = "There was an error saving your new to-do item. Please try again."
      render :new
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.assign_attributes(item_params)

    if @item.save
      flash[:notice] = "Your to-do item was updated."
      redirect_to welcome_index_path
     else
      flash.now[:alert] = "There was an error saving the to-do item. Please try again."
      render :edit
     end
   end

  private

  def item_params
    params.permit(:name, :user_id)
  end

end
