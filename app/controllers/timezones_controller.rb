class TimezonesController < ApplicationController
  before_action :set_timezone, only: [:show, :edit, :update, :destroy]

  # GET /timezones
  # GET /timezones.json
  def index
    @timezones = Timezone.all
  end

  # GET /timezones/1
  # GET /timezones/1.json
  def show
  end

  # GET /timezones/new
  def new
    @timezone = Timezone.new
  end

  # GET /timezones/1/edit
  def edit
  end

  # POST /timezones
  # POST /timezones.json
  def create
    @timezone = Timezone.new(timezone_params)

    respond_to do |format|
      if @timezone.save
        format.html { redirect_to @timezone, notice: 'Timezone was successfully created.' }
        format.json { render action: 'show', status: :created, location: @timezone }
      else
        format.html { render action: 'new' }
        format.json { render json: @timezone.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /timezones/1
  # PATCH/PUT /timezones/1.json
  def update
    respond_to do |format|
      if @timezone.update(timezone_params)
        format.html { redirect_to @timezone, notice: 'Timezone was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @timezone.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /timezones/1
  # DELETE /timezones/1.json
  def destroy
    @timezone.destroy
    respond_to do |format|
      format.html { redirect_to timezones_url }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_timezone
    @timezone = Timezone.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def timezone_params
    params.require(:timezone).permit(:id, :name, :tzinfo, :utc, settings_attributes: [:id, :setting_id, :screen_name], matches_attributes: [:id, :match_id, :name], cities_attributes: [:id, :city_id, :name])
  end
end
