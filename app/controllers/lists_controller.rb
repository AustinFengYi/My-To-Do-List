class ListsController < ApplicationController
	before_action :set_list, :only =>[:edit,:update,:destroy,:complete]
	def index
		@lists = List.all
	end


    def complete 
    if @list.completed == false
       @list.update_attribute(:completed, true)
    else
      @list.update_attribute(:completed, false)
    end
    redirect_to lists_path(@list)
    end

    def new
    	@list = List.new    	
    end

    def create
    	@list = List.new(list_params)
    	if@list.save
    	  redirect_to lists_path
    	else
    	  render :new
    	end
    end


    def edit
    end

    def update
        if @list.update_attributes(list_params)

           redirect_to lists_path
        else
           render :edit
        end
    end

    def destroy
         @list.destroy

         redirect_to lists_url
    end


    private

    def set_list
    	@list = List.find(params[:id])
    end
    def list_params
    	params.require(:list).permit(:title, :date, :description)
    end



end
