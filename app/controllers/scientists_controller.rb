class ScientistsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :render_not_found


  # GET /scientists
  def index
    scientists = Scientist.all

    render json: scientists, status: :ok
  end

  # GET /scientists/1
  def show
    scientist = Scientist.find(params[:id])
    render json: scientist
  end

  # POST /scientists
  def create
    scientist = Scientist.create(scientist_params)
      if scientist.valid?
      render json: scientist, status: :created
      else
      return render json: { errors: scientist.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /scientists/1
  def update
    scientist = Scientist.find(params[:id])
    if scientist.update(scientist_params)
      render json: scientist, status: :accepted
    else
      render json: { errors: scientist.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # DELETE /scientists/1
  def destroy
    scientist = Scientist.find(params[:id])
    scientist.destroy
  end

  private

    # Only allow a list of trusted parameters through.
    def scientist_params
      params.permit(:id, :name, :field_of_study, :avatar, :planets)
    end

    def render_not_found
      return render json: { error: "Scientist not found" }, status: :not_found
    end

    def render_invalid_record
      return render json: { errors: scientist.error.full_messages }, status: :unprocessable_entity
    end

end
