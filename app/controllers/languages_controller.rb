class LanguagesController < ApplicationController
  before_action :set_language, only: [:show]

  layout false

  # GET /languages
  # GET /languages.json
  def index
    @cities = City.all
  end

  # GET /languages/1
  # GET /languages/1.json
  def show
  end


  private
  # Use callbacks to share common setup or constraints between actions.
  def set_city
    @language = Language.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def city_params
    params.require(:language).permit(:id, :name, :code, settings_attributes: [:id, :setting_id, :screen_name])


  end
end
