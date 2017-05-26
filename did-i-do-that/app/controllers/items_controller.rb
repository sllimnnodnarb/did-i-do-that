class ItemsController < ApplicationController

  def index
    @items = Item.uncompleted
    @users = User.all
  end

  def show
    @user = current_user
    @item = Item.find(params[:id])
    @items = Item.all
    @old = []
  end

  def new
    @item = Item.new
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

   def destroy
     @item = Item.find(params[:id])
     if @item.update_attribute(:completed, true)
       flash[:notice] = "\"#{@item.name}\" was successfully removed from your to-do list."
       redirect_to root_path
     else
       flash.now[:alert] = "There was an error marking the item complete, try again."
       render :show
     end
   end

  private

  def item_params
    params.require(:item).permit(:name, :user_id)
  end

end
