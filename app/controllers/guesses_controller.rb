class GuessesController < ApplicationController
  before_action :set_guess, only: [:show, :edit, :update, :destroy]

  layout false

  # GET /guesses
  # GET /guesses.json
  def index
    @guesses = Guess.all
  end

  # GET /guesses/1
  # GET /guesses/1.json
  def show
  end

  # GET /guesses/new
  def new

    @match_id = params[:match_id]
    @pens = to_bool(params[:pens])
    @guess = Guess.new
  end

  # GET /guesses/1/edit
  def edit
    @match_id = params[:match_id]
    @pens = to_bool(params[:pens])
    @guess_id = params[:id]


  end

  # POST /guesses
  # POST /guesses.json
  def create
    @guess = Guess.new(guess_params)

    respond_to do |format|
      if @guess.save
        format.json { render action: 'show', status: :created, location: @guess }
        format.html { redirect_to Match.find(@guess.match_id), notice: 'You successfully submitted the score.' }
      else
        format.json { render json: @guess.errors, status: :unprocessable_entity }
        format.html { render action: 'new' }
      end
    end
  end

  # PATCH/PUT /guesses/1
  # PATCH/PUT /guesses/1.json
  def update


    respond_to do |format|
      if @guess.update(guess_params)

        format.json { head :no_content }
        format.html { redirect_to Match.find(@guess.match_id), notice: 'You successfully update the score.' }
      else
        format.json { render json: @guess.errors, status: :unprocessable_entity }
        format.html { render action: 'edit' }
      end
    end
  end

  # DELETE /guesses/1
  # DELETE /guesses/1.json
  def destroy
    @guess.destroy
    respond_to do |format|
      format.html { redirect_to guesses_url }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_guess
    @guess = Guess.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def guess_params
    params.require(:guess).permit(:user_id, :match_id, :goals_a, :goals_b, :pens_a, :pens_b, :points)
  end


  def to_bool(str)
    return true if str == true || str =~ (/^(true|t|yes|y|1)$/i)
    return false if str == false || str.blank? || self =~ (/^(false|f|no|n|0)$/i)
  end

end
