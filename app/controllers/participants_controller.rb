class ParticipantsController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:user_id])
    
    @games = Game.joins(:pool)
    @user_predictions = @user.predictions
    
    total_predictions = @user.predictions.where('points IS NOT null').count
    
    if total_predictions > 0
      result_success_predictions = @user.predictions.where('points = 3').count
      winner_success_predictions = @user.predictions.where('points = 1').count
    
      @user_result_success_rate = (result_success_predictions * 100 ) / total_predictions
      @user_winner_success_rate = (winner_success_predictions * 100 ) / total_predictions
    else
      @user_result_success_rate = 0
      @user_winner_success_rate = 0
    end
  end
end
