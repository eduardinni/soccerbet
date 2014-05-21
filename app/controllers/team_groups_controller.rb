class TeamGroupsController < ApplicationController
  before_filter :authorize_admin
  before_action :set_team_group, only: [:show, :edit, :update, :destroy]

  # GET /team_groups
  # GET /team_groups.json
  def index
    @team_groups = TeamGroup.all
  end

  # GET /team_groups/1
  # GET /team_groups/1.json
  def show
  end

  # GET /team_groups/new
  def new
    @team_group = TeamGroup.new
  end

  # GET /team_groups/1/edit
  def edit
  end

  # POST /team_groups
  # POST /team_groups.json
  def create
    @team_group = TeamGroup.new(team_group_params)

    respond_to do |format|
      if @team_group.save
        format.html { redirect_to @team_group, notice: 'Team group was successfully created.' }
        format.json { render :show, status: :created, location: @team_group }
      else
        format.html { render :new }
        format.json { render json: @team_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /team_groups/1
  # PATCH/PUT /team_groups/1.json
  def update
    respond_to do |format|
      if @team_group.update(team_group_params)
        format.html { redirect_to @team_group, notice: 'Team group was successfully updated.' }
        format.json { render :show, status: :ok, location: @team_group }
      else
        format.html { render :edit }
        format.json { render json: @team_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /team_groups/1
  # DELETE /team_groups/1.json
  def destroy
    @team_group.destroy
    respond_to do |format|
      format.html { redirect_to team_groups_url, notice: 'Team group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team_group
      @team_group = TeamGroup.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def team_group_params
      params.require(:team_group).permit(:name)
    end
end
