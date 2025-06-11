class LevelController < ApplicationController
  def index
     @levels = Level.all.order(id: :asc)
  end

  def level
    # basically the show view
    if  Level.exists?(params[:id]) then
      @level = Level.find(params[:id])
      # only use if im trying to update the levels
      # @level.images.attach(io: File.open("storage/Level_Assets/MMX_#{params[:id]}.webp"), filename: "MMX_#{params[:id]}.webp")

      respond_to do | format|
        format.html
        format.xml { render xml: url_for(@level.images) }
        format.json { render json: url_for(@level.images) }
    end
    else
      redirect_to :root
      flash[:alert] = "Level does not exist!"
    end
  end

  def about
  end
end
