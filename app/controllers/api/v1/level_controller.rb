module Api
  module V1
    class LevelController < ApplicationController
      respond_to :json
      @@starting_time = 0
      def counter(levelComplete = false, starting_time = Time.now())
        if levelComplete == true then
          @@final_time = (Time.now - starting_time)
          session[:time] = @@final_time
        end
      end

        def data ## Level Data
            if  Level.exists?(params[:id]) then
              @@starting_time = Time.now()
              @level = Level.find(params[:id])
              @coordinates = @level.coordinates.map do |coordinate|
                 { 'character_id': coordinate.character_id, 'x_cord': coordinate.x_cord, 'y_cord': coordinate.y_cord }
              end
              respond_with({ 'level_id': @level.id, 'coordinates': @coordinates, 'url': url_for(@level.images) })
            else
              respond_with("This level does not exist!")
              flash[:alert] = "Level does not exist!"
            end
        end


        def new_score
          counter(true, @@starting_time)
          # @score = Score.new(score_params.merge({ player_score: session[:time], level_id: params[:id] }))
          @score = Scoreboard.new(player_name: params[:player_name], score: session[:time].to_s, level_id: params[:id])
          if @score then
            @score.save
            render :scoreboard
          else
            render :root
            flash[:alert] = "There was an error!"
          end

        private

        def score_params
          params.permit(:player_name)
        end
        end
    end
  end
end
