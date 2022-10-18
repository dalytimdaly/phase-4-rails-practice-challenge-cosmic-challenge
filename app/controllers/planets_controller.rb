class PlanetsController < ApplicationController

  # GET /planets
  def index
    planets = Planet.all

    render json: planets
  end

  # GET /planets/1
  def show
    planet = Planet.find(params[:id])
    render json: planet
  end

  # POST /planets
  def create
    planet = Planet.new(planet_params)

    if planet.save
      render json: planet, status: :created
    else
      render json: planet.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /planets/1
  def update
    planet = Planet.find(params[:id])
    if planet.update(planet_params)
      render json: planet
    else
      render json: planet.errors, status: :unprocessable_entity
    end
  end

  # DELETE /planets/1
  def destroy
    planet = Planet.find(params[:id])
    planet.destroy
  end

  private

    # Only allow a list of trusted parameters through.
    def planet_params
      params.permit(:name, :distance_from_earth, :nearest_star, :image, :id)
    end
end
