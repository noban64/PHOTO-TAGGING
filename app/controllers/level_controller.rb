class LevelController < ApplicationController

	def index
		 @levels = Level.all;

	end	

	def level
		# @level = Level.where(params[:id]);
		@testing = [1,2,3,4]

		respond_to do | format| 
				format.html
				format.xml { render :xml => @testing} 
				format.json { render :json => @testing} 
		end
	end

	def about 

	end 

end
