class ScoreboardController < ApplicationController
  def view
    @scoreboard = Scoreboard.all;
  end

  def new
  end
  def create
  end
end
