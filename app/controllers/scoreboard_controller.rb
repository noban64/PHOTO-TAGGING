class ScoreboardController < ApplicationController
  include Pagy::Backend
  Pagy::DEFAULT[:limit] = 15
  Pagy::DEFAULT[:size] = 9
  Pagy::DEFAULT[:overflow] = :last_page

  rescue_from Pagy::OverflowError, with: :redirect_to_last_page

  def view
    @scoreboard = Scoreboard.all.order(score: :asc)
    @page_number = params[:page].to_i
      if @page_number <=0  then
        @pagy, @scoreboard= pagy(@scoreboard, page: 1)
      else
        @pagy, @scoreboard= pagy(@scoreboard)
      end
  end


  private

  def redirect_to_last_page(exception)
    redirect_to url_for(page: 1), notice: ""
  end
end
