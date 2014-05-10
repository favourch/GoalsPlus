class SettingsController < ApplicationController
  before_action :set_setting, only: [:show, :edit, :update, :activate, :destroy]

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
    if current_user.setting_id != 1
      redirect_to '/settings'

    end
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

        if User.find(current_user.id).update_attribute(:setting_id, @setting.id)
          puts 'User ' + current_user.user_name.to_s + ' has created his settings.'
        else
          puts 'DB recording failed'
        end


        format.html { redirect_to '/', notice: 'Settings were successfully created.' }
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

    #puts YAML::dump(setting_params[:screen_name])
    respond_to do |format|
      if @setting.update(setting_params)
        if setting_params[:role_id]
          format.json { head :no_content }
          format.html { redirect_to @setting, notice: 'Settings were successfully updated.' }
        else
          format.html { redirect_to '/', notice: 'Settings were successfully updated.' }
          format.json { head :no_content }
        end

      else
        format.json { render json: @setting.errors, status: :unprocessable_entity }

        format.html { render action: 'edit' }
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
  def setting_params
    params.require(:setting).permit(:id, :screen_name, :cell_phone, :role_id, :team_id, :timezone_id, :beer, :language_id, users_params: [:id, :user_name])
  end
end