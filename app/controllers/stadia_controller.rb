class StadiaController < ApplicationController
  before_action :set_stadium, only: [:show, :edit, :update, :destroy]


  layout false

  # GET /stadia
  # GET /stadia.json
  def index
    @stadia = Stadium.all
  end

  # GET /stadia/1
  # GET /stadia/1.json
  def show
  end

  # GET /stadia/new
  def new
    @stadium = Stadium.new
    @cities = City.all.order("name ASC")

  end

  # GET /stadia/1/edit
  def edit
    @cities = City.all.order("name ASC")
  end

  # POST /stadia
  # POST /stadia.json
  def create
    @stadium = Stadium.new(stadium_params)

    respond_to do |format|
      if @stadium.save
        format.json { render action: 'show', status: :created, location: @stadium }
        format.html { redirect_to @stadium, notice: 'Stadium was successfully created.' }
      else
        format.html { render action: 'new' }
        format.json { render json: @stadium.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stadia/1
  # PATCH/PUT /stadia/1.json
  def update
    respond_to do |format|
      if @stadium.update(stadium_params)
        format.json { head :no_content }
        format.html { redirect_to @stadium, notice: 'Stadium was successfully updated.' }
      else
        format.html { render action: 'edit' }
        format.json { render json: @stadium.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stadia/1
  # DELETE /stadia/1.json
  def destroy
    @stadium.destroy
    respond_to do |format|
      format.html { redirect_to stadia_url }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_stadium
    @stadium = Stadium.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def stadium_params
    params.require(:stadium).permit(:id, :name, :capacity, :city_id, matches_attributes: [:id, :match_id, :name], teams_attributes: [:id, :team_id, :name])
  end
end
