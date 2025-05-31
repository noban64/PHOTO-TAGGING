class LevelController < ApplicationController

	def index
		 @levels = Level.all;

	end	

	def level 
		# basically the show view
		if  Level.exists?(params[:id]) then 
			@level = Level.find(params[:id]);
		else 
			redirect_to :root;
			flash[:alert] = "Level does not exist!"
		end

		###
		@testing = [1,2,3,4]
		respond_to do | format| 
				format.html
				format.xml { render :xml => @testing} 
				format.json { render :json => @testing} 
		end
		###
	end

	def about 

	end 

end
