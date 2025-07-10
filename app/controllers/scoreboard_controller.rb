class ScoreboardController < ApplicationController
  def view

    @scoreboard = Scoreboard.all.order(score: :asc)
    # @scoreboard = Scoreboard.all.order(score: :asc).limit(25)

  end

  def viewWIP
  page = params[:id]
  @scoreboard = Scoreboard.all.order(score: :asc).limit(10).offset(page*10)

    def pageQuery
      pageNumber = Scoreboard.all.length
    end
  end

  def new
  end
  def create
  end
end