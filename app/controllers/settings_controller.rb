class SettingsController < ApplicationController
  before_action :set_setting, only: [:show, :edit, :update, :destroy]

  # GET /Setting
  # GET /Setting.json
  def index
    @setting = Setting.find(current_user.setting)
  end

  # GET /Setting/1
  # GET /Setting/1.json
  def show
  end

  # GET /Setting/new
  def new
    @setting = Setting.new
  end

  # GET /Setting/1/edit
  def edit
  end

  # POST /Setting
  # POST /Setting.json
  def create
    @setting = Setting.new(setting_params)

    respond_to do |format|
      if @setting.save
        format.html { redirect_to @setting, notice: 'Settings were successfully created.' }
        format.json { render action: 'show', status: :created, location: @setting }
      else
        format.html { render action: 'new' }
        format.json { render json: @setting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stadia/1
  # PATCH/PUT /stadia/1.json
  def update
    respond_to do |format|
      if @setting.update(setting_params)
        format.html { redirect_to @setting, notice: 'Settings were successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @setting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stadia/1
  # DELETE /stadia/1.json
  def destroy
    @setting.destroy
    respond_to do |format|
      format.html { redirect_to '/' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_setting
    @setting = Setting.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def stadium_params
    params.require(:settings).permit(:screen_name, :cell_phone, :role, :timezone, :beer, :language)
  end
end