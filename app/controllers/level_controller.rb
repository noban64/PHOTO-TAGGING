class LevelController < ApplicationController
  def index
     @levels = Level.all.order(id: :asc)
    #  attach();
  end

  def attach 
    @levels = Level.all.order(id: :asc)
    
    @levels.each do |level|
      level.images.attach(io: File.open("storage/Level_Assets/MMX_#{level.id}.webp"), filename: "MMX_#{level.id}.webp")
    end
  end

  def level
    # basically the show view
    if  Level.exists?(params[:id]) then
      @level = Level.find(params[:id])

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

  def scoreboard
    @scoreboard = Scoreboard.new("level_id": params[:id], "player_name": params[:name] || "Anonymous", "score": session[:time])
  end
  def about
  end
end
