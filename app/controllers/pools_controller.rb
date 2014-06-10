class PoolsController < ApplicationController
  before_filter :authorize_admin, except: [:leaderboards, :stats, :participants]
  before_action :set_pool, only: [:show, :edit, :update, :destroy]

  # GET /pools
  # GET /pools.json
  def index
    @pools = Pool.unscoped.all
  end

  # GET /pools/1
  # GET /pools/1.json
  def show
  end

  # GET /pools/new
  def new
    @pool = Pool.new
  end

  # GET /pools/1/edit
  def edit
  end
  
  # GET /leaderboards
  def leaderboards
    @pools = Pool.all
  end
  
  # GET /stats
  def stats
    if params[:pool].blank?
      @games = Game.joins(:pool)
      @user_predictions = current_user.predictions
    else
      @games = Game.where(pool_id: params[:pool])
      @user_predictions = current_user.predictions
    end
  end

  # POST /pools
  # POST /pools.json
  def create
    @pool = Pool.new(pool_params)

    respond_to do |format|
      if @pool.save
        format.html { redirect_to pools_url, notice: t('flash.created_success') }
        format.json { render :show, status: :created, location: @pool }
      else
        format.html { render :new }
        format.json { render json: @pool.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pools/1
  # PATCH/PUT /pools/1.json
  def update
    respond_to do |format|
      if @pool.update(pool_params)
        format.html { redirect_to pools_url, notice: t('flash.edited_success') }
        format.json { render :show, status: :ok, location: @pool }
      else
        format.html { render :edit }
        format.json { render json: @pool.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pools/1
  # DELETE /pools/1.json
  def destroy
    @pool.destroy
    respond_to do |format|
      format.html { redirect_to pools_url, notice: t('flash.destroyed_success') }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pool
      @pool = Pool.unscoped.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pool_params
      params.require(:pool).permit(:name, :active)
    end
end
