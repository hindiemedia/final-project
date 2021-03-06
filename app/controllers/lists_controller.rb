class ListsController < ApplicationController
	before_action :authenticate_user!, only: [:new, :create]

	def index
	@lists = List.all
	end

	def create
    @list = List.new(list_params)
	    if @list.save
	      redirect_to root_path
	  	else
	  	  render :new
	  	end
    end

    def new
	    @list = List.new
	    #redirect_to root_path
    end

    def edit
	    @list = List.find( params[:id])
	end

	def show
    	@list = List.find params[:id]
    	@item = Item.new
  	end

	def update
	   @list = List.find( params[:id])
	   safe_list_params = params.require(:list).permit(:name, :date_created)

	   if @list.update(safe_list_params)
	      redirect_to @list
	   else
	      render 'edit'
	   end
	end

    def destroy
	    list = List.find(params[:id])
	    list.destroy
	    redirect_to root_path
	  end

private
	     def list_params
		    params.require(:list).permit(:name, :date_created)
		 end
    
end
