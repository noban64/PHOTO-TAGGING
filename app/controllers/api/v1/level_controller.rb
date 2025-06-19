module Api
  module V1
    class LevelController < ApplicationController
      respond_to :json
        def data ## Level Data
            if  Level.exists?(params[:id]) then
              @level = Level.find(params[:id])
              @coordinates = @level.coordinates.map do |coordinate|
                 {'character_id': coordinate.character_id, 'x_cord': coordinate.x_cord, 'y_cord': coordinate.y_cord}
              end
              respond_with({'level_id': @level.id, 'coordinates': @coordinates, 'url': url_for(@level.images)})
            else
              respond_with("This level does not exist!")
              flash[:alert] = "Level does not exist!"
            end
        end
    end
  end
end
