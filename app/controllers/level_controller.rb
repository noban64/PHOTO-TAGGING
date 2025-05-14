class LevelController < ApplicationController

	def index
		 @levels = Level.all;
	end	

	def level
		# @level = Level.where(params[:id]);
	end

	def about 
	end 

end
