class JobLocationsController < ApplicationController
  before_action :set_job_location, only: [:show, :edit, :update, :destroy]

  # GET /job_locations
  # GET /job_locations.json
  def index
    @job_locations = JobLocation.all
  end

  # GET /job_locations/1
  # GET /job_locations/1.json
  def show
  end

  # GET /job_locations/new
  def new
    @job_location = JobLocation.new
  end

  # GET /job_locations/1/edit
  def edit
  end

  # POST /job_locations
  # POST /job_locations.json
  def create
    @job_location = JobLocation.new(job_location_params)

    respond_to do |format|
      if @job_location.save
        format.html { redirect_to @job_location, notice: 'Job location was successfully created.' }
        format.json { render :show, status: :created, location: @job_location }
      else
        format.html { render :new }
        format.json { render json: @job_location.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /job_locations/1
  # PATCH/PUT /job_locations/1.json
  def update
    respond_to do |format|
      if @job_location.update(job_location_params)
        format.html { redirect_to @job_location, notice: 'Job location was successfully updated.' }
        format.json { render :show, status: :ok, location: @job_location }
      else
        format.html { render :edit }
        format.json { render json: @job_location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /job_locations/1
  # DELETE /job_locations/1.json
  def destroy
    @job_location.destroy
    respond_to do |format|
      format.html { redirect_to job_locations_url, notice: 'Job location was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job_location
      @job_location = JobLocation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_location_params
      params.require(:job_location).permit(:name, :info, :url)
    end
end
