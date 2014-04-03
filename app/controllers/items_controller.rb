class ItemsController < ApplicationController
def index
	@items = Item.all
	end

	def create
    @item = Item.new(item_params)
	    if @item.save
	      redirect_to root_path
	  	else
	  	  render :new
	  	end
    end

    def new
	    @item = Item.new
	    #redirect_to root_path
    end

    def edit
	    @item = Item.find( params[:id])
	end

	def show
    	@item = Item.find params[:id]
    	 redirect_to root_path
  	end

	def update
	   @item = Item.find( params[:id])
	   safe_item_params = params.require(:item).permit(:name, :list_id)

	   if @item.update(safe_item_params)
	      redirect_to @item
	   else
	      render 'edit'
	   end
	end

    def destroy
	    item = Item.find(params[:id])
	    item.destroy
	    redirect_to root_path
	  end

private
	     def item_params
		    params.require(:item).permit(:name, :list_id)
		 end
end
