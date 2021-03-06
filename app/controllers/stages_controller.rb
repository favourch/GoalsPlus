class StagesController < ApplicationController
  before_action :set_stage, only: [:show, :edit, :update, :destroy]

  layout false

  # GET /stages
  # GET /stages.json
  def index
    @stages = Stage.all
  end

  # GET /stages/1
  # GET /stages/1.json
  def show
  end

  # GET /stages/new
  def new
    @stage = Stage.new
  end

  # GET /stages/1/edit
  def edit
  end

  # POST /stages
  # POST /stages.json
  def create
    @stage = Stage.new(stage_params)

    respond_to do |format|
      if @stage.save
        format.json { render action: 'show', status: :created, location: @stage }
        format.html { redirect_to @stage, notice: 'Stage was successfully created.' }
      else
        format.json { render json: @stage.errors, status: :unprocessable_entity }
        format.html { render action: 'new' }
      end
    end
  end

  # PATCH/PUT /stages/1
  # PATCH/PUT /stages/1.json
  def update
    respond_to do |format|
      if @stage.update(stage_params)
        format.json { head :no_content }
        format.html { redirect_to @stage, notice: 'Stage was successfully updated.' }
      else
        format.json { render json: @stage.errors, status: :unprocessable_entity }
        format.html { render action: 'edit' }
      end
    end
  end

  # DELETE /stages/1
  # DELETE /stages/1.json
  def destroy
    @stage.destroy
    respond_to do |format|
      format.html { redirect_to stages_url }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_stage
    @stage = Stage.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def stage_params
    params.require(:stage).permit(:id, :name, matches_attributes: [:id, :match_id, :name])
  end
end
