module Api
  module V1
    class LevelController < ApplicationController
      respond_to :json
        def data
          # basically the show view
            if  Level.exists?(params[:id]) then
              @level = Level.find(params[:id])
              # temporarily
              respond_with({"url": url_for(@level.images)})
              # respond_with(@level)
            else
              respond_with("This level does not exist!")
              flash[:alert] = "Level does not exist!"
            end
        end
    end
  end
end
