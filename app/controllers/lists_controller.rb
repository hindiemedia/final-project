class ListsController < ApplicationController
	def index
	@lists = List.all
	end

	def create
    @list = List.new(params[:list])
	    if @list.save
	      redirect_to root_path
	  	else
	  	  render :new
	  	end

	  	private
	     def list_params
		    params.require(:list).permit(:name, :date_created)
		 end
    end

    def new
	    @list = List.new
	    respond_to do |format|
	    	format.html
	    	format.json {render json: @list}
	    end
	    #redirect_to root_path
    end

    
end
