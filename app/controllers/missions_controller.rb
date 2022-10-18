class MissionsController < ApplicationController

  # GET /missions
  def index
    missions = Mission.all

    render json: missions
  end

  # GET /missions/1
  def show
    mission = Mission.find(params[:id])
    render json: mission
  end

  # POST /missions
  def create
    mission = Mission.create(mission_params)

    if mission.valid?
      render json: mission.planet, status: :created
    else
      render json: { errors: mission.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /missions/1
  def update
    mission = Mission.find(params[:id])
    if mission.update(mission_params)
      render json: mission
    else
      render json: mission.errors, status: :unprocessable_entity
    end
  end

  # DELETE /missions/1
  def destroy
    mission = Mission.find(params[:id])
    mission.destroy
  end

  private
    # Only allow a list of trusted parameters through.
    def mission_params
      params.permit(:name, :scientist_id, :planet_id)
    end

end
