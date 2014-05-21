class GameResultsController < ApplicationController
  before_filter :authorize_admin
  before_action :set_game_result, only: [:show, :edit, :update, :destroy]
  
  include NotificationsHelper

  # GET /game_results
  # GET /game_results.json
  def index
    @game_results = GameResult.all
  end

  # GET /game_results/1
  # GET /game_results/1.json
  def show
  end

  # GET /game_results/new
  def new
    if params[:game].present?
        @game = Game.find(params[:game])
    else
      raise
    end
    
    @game_result = GameResult.new(game_id: params[:game].to_i)
    
  end

  # GET /game_results/1/edit
  def edit
    @game = @game_result.game
  end

  # POST /game_results
  # POST /game_results.json
  def create
    @game_result = GameResult.new(game_result_params)

    respond_to do |format|
      if @game_result.save
        # Evaluate predictions
        evaluate_user_predictions(@game_result.game.id)
        format.html { redirect_to games_url, notice: t('flash.created_success') }
        format.json { render :show, status: :created, location: @game_result }
      else
        format.html { render :new }
        format.json { render json: @game_result.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /game_results/1
  # PATCH/PUT /game_results/1.json
  def update
    respond_to do |format|
      if @game_result.update(game_result_params)
        # Evaluate predictions
        evaluate_user_predictions(@game_result.game.id)
        format.html { redirect_to games_url, notice: t('flash.created_success') }
        format.json { render :show, status: :ok, location: @game_result }
      else
        format.html { render :edit }
        format.json { render json: @game_result.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /game_results/1
  # DELETE /game_results/1.json
  def destroy
    @game_result.destroy
    respond_to do |format|
      format.html { redirect_to game_results_url, notice: 'Game result was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game_result
      @game_result = GameResult.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def game_result_params
      params.require(:game_result).permit(:game_id, :home_team_goals, :visitor_team_goals)
    end
    
    def evaluate_user_predictions(game_id)
      game = Game.find(game_id)
      
      pool_leaderboard = Leaderboard.new(game.pool.id, Leaderboard::DEFAULT_OPTIONS, {redis_connection: $redis})
      global_leaderboard = Leaderboard.new('global', Leaderboard::DEFAULT_OPTIONS, {redis_connection: $redis})
      
      game_users_predictions = UserPrediction.where(game: game_id)
      
      game_users_predictions.each do |prediction|
          if (@game_result.home_team_goals == prediction.home_team_goals) and (@game_result.visitor_team_goals == prediction.visitor_team_goals)
              points = 3
              fb_notification_won_points(prediction.user, points, prediction.id)
          elsif @game_result.winner == prediction.winner
              points = 1
              fb_notification_won_points(prediction.user, points, prediction.id)
          else
              points = 0
          end
          
          unless prediction.points.nil?
              pool_leaderboard.change_score_for(prediction.user.id, -prediction.points)
              global_leaderboard.change_score_for(prediction.user.id, -prediction.points)
          end
          
          pool_leaderboard.change_score_for(prediction.user.id, points)
          global_leaderboard.change_score_for(prediction.user.id, points)
          
          prediction.points = points
          prediction.save
      end
    end
end
