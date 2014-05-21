class UserPredictionsController < ApplicationController
  before_filter :authorize_admin, only: [:destroy]
  before_action :set_user_prediction, only: [:show, :edit, :update, :destroy]
  protect_from_forgery except: [:index]

  # GET /user_predictions
  # GET /user_predictions.json
  def index
    if params[:pool].blank?
      @games = Game.joins(:pool)
      @user_predictions = current_user.predictions
    else
      @games = Game.where(pool_id: params[:pool])
      @user_predictions = current_user.predictions
    end
  end

  # GET /user_predictions/1
  # GET /user_predictions/1.json
  def show
  end

  # GET /user_predictions/new
  def new
    if params[:game].present?
      @game = Game.find(params[:game])
      
      unless @game.pool.active?
          return redirect_to user_predictions_url, alert: t('flash.pool_not_active')
      end
      
      unless @game.ontime_to_edit?
          return redirect_to user_predictions_url, alert: t('flash.edit_time_expired')
      end
      
      @user_prediction = UserPrediction.new(game_id: params[:game].to_i)
    else
      raise
    end
  end

  # GET /user_predictions/1/edit
  def edit
    unless @user_prediction.game.ontime_to_edit?
        return redirect_to user_predictions_url, alert: t('flash.edit_time_expired')
    end
    
    unless @user_prediction.game.pool.active?
        return redirect_to user_predictions_url, alert: t('flash.pool_not_active')
    end
    
    if @user_prediction.user != current_user
        return redirect_to user_predictions_url, alert: t('flash.access_denied')
    end
    
    @game = @user_prediction.game
  end

  # POST /user_predictions
  # POST /user_predictions.json
  def create
    
    if params[:user_prediction][:game_id].present?
      @game = Game.find(params[:user_prediction][:game_id])
      
      unless @game.pool.active?
          return redirect_to user_predictions_url, alert: t('flash.pool_not_active')
      end
      
      unless @game.ontime_to_edit?
          return redirect_to user_predictions_url, alert: t('flash.edit_time_expired')
      end
    end
    
    @user_prediction = UserPrediction.new(user_prediction_params)
    @user_prediction.user = current_user

    respond_to do |format|
      if @user_prediction.save
        format.html { redirect_to user_predictions_url, notice: t('flash.created_success') }
        format.json { render :show, status: :created, location: @user_prediction }
      else
        format.html { render :new }
        format.json { render json: @user_prediction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_predictions/1
  # PATCH/PUT /user_predictions/1.json
  def update
    unless @user_prediction.game.pool.active?
        return redirect_to user_predictions_url, alert: t('flash.pool_not_active')
    end
    
    unless @user_prediction.game.ontime_to_edit?
        return redirect_to user_predictions_url, alert: t('flash.edit_time_expired')
    end
    
    if @user_prediction.user != current_user
        return redirect_to user_predictions_url, alert: t('flash.access_denied')
    end
    
    respond_to do |format|
      if @user_prediction.update(user_prediction_params)
        format.html { redirect_to user_predictions_url, notice: t('flash.created_success') }
        format.json { render :show, status: :ok, location: @user_prediction }
      else
        format.html { render :edit }
        format.json { render json: @user_prediction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_predictions/1
  # DELETE /user_predictions/1.json
  def destroy
    @user_prediction.destroy
    respond_to do |format|
      format.html { redirect_to user_predictions_url, notice: 'User prediction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_prediction
      @user_prediction = UserPrediction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_prediction_params
      params.require(:user_prediction).permit(:game_id, :home_team_goals, :visitor_team_goals)
    end
end
