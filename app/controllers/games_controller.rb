class GamesController < ApplicationController
  before_filter :authorize_admin, except: [:predictions]
  before_action :set_game, only: [:show, :edit, :update, :destroy]
  
  include PoolsHelper

  # GET /games
  # GET /games.json
  def index
    if params[:pool].blank?
      @games = Game.all
    else
      @games = Game.where(pool_id: params[:pool])
    end
    @pools = Pool.unscoped.all
  end

  # GET /games/1
  # GET /games/1.json
  def show
  end

  # GET /games/new
  def new
    @game = Game.new(pool_id: params[:pool].to_i)
  end

  # GET /games/1/edit
  def edit
  end
  
  # GET /games/1/predictions
  def predictions
    @game = Game.find(params[:game_id])
    @users = User.all
  end

  # POST /games
  # POST /games.json
  def create
    @game = Game.new(game_params)

    respond_to do |format|
      if @game.save
        format.html { redirect_to games_url, notice: t('flash.created_success') }
        format.json { render :show, status: :created, location: @game }
      else
        format.html { render :new }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /games/1
  # PATCH/PUT /games/1.json
  def update
    respond_to do |format|
      if @game.update(game_params)
        format.html { redirect_to games_url, notice: t('flash.edited_success') }
        format.json { render :show, status: :ok, location: @game }
      else
        format.html { render :edit }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /games/1
  # DELETE /games/1.json
  def destroy
    @game.destroy
    respond_to do |format|
      format.html { redirect_to games_url, notice: t('flash.destroyed_success') }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @game = Game.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def game_params
      params.require(:game).permit(:home_team_id, :visitor_team_id, :play_at, :pool_id, :team_group_id)
    end
end
