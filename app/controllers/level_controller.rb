class LevelController < ApplicationController

	def index
		 @levels = Level.all;
	end	

	def view
	end

end
