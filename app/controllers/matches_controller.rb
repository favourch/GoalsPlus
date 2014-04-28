class MatchesController < ApplicationController
  before_action :set_match, only: [:show, :edit, :score, :update, :destroy]

  include ActionView::Helpers::DateHelper


  # GET /matches
  # GET /matches.json
  def index

    per_page = 8

    Time.zone = current_user.setting.timezone.name

    #today = Time.zone.parse('2014-06-29 17:00:00').to_s(:db)
    today = Date.current().to_s(:db)

    current_page = (Match.where("date <= :date", {date: today}).count.to_f / per_page).ceil

    current_page = 1 if current_page == 0

    page = params[:page] ? params[:page] : current_page

    @matches = Match.order("date ASC").paginate(:page => page, :per_page => per_page)

    all_matches = Array.new


    @matches.each do |match|

      my_guess = Array.new

      matchTime = Time.current - match.date
      past = true

      if match.date > Time.current
        past = false
        local_time = distance_of_time_in_words(Time.current, match.date) + ' left'
      elsif matchTime > 0 and matchTime < 7200
        local_time = 'Match is in progress'
      else
        local_time = 'Match is over'
      end


      @my_guess = Guess.where(match_id: match.id, user_id: current_user.id).limit(1)
      @my_guess.each do |g|
        my_guess = {
            id: g.id,
            user: g.user.setting.screen_name,
            match_id: g.match_id,
            goals_a: g.goals_a,
            goals_b: g.goals_b,
            pens_a: g.pens_a,
            pens_b: g.pens_b,
            points: g.points
        }
      end

      guesses = Array.new

      Guess.where(match_id: match.id).each do |guess|

        guesses.push({
                         id: guess.id,
                         user: guess.user.setting.screen_name,
                         match_id: guess.match_id,
                         goals_a: guess.goals_a,
                         goals_b: guess.goals_b,
                         pens_a: guess.pens_a,
                         pens_b: guess.pens_b,
                         points: guess.points
                     })
      end

      all_matches.push({
                           id: match.id,
                           team_a: match.team_a.name,
                           team_b: match.team_b.name,
                           stadium: match.stadium.name,
                           city: match.stadium.city.name,
                           country: match.stadium.city.country.code,
                           tournament: match.tournament.name,
                           stage: match.stage.name,
                           date: match.date,
                           timezone: match.timezone.name,
                           pens: match.pens,
                           goals_a: match.goals_a,
                           goals_b: match.goals_b,
                           pens_a: match.pens_a,
                           pens_b: match.pens_b,
                           coof_a: match.coof_a,
                           coof_x: match.coof_x,
                           coof_b: match.coof_b,
                           local_time: local_time,
                           past: past,
                           guesses: guesses,
                           my_guess: my_guess,
                           guess: @my_guess
                       })

    end

    @all = all_matches


    #puts current_user.settings.timezone.name


    #db_time = '2014-06-12 17:00:00'
    #brazil_tz = 'Brasilia'
    #user_tz = current_user.settings.timezone.name

    #Time.zone = brazil_tz

    #time = Time.zone.parse(db_time)

    #puts '---------------------'
    #puts 'Time: '
    #puts time
    #puts 'Timezone: '
    #puts brazil_tz
    #puts '---------------------'

    #new_time = time.in_time_zone(brazil_tz)
    #puts 'New Time: '
    #puts new_time
    #puts '---------------------'
    #user_time = new_time.in_time_zone(user_tz)
    #puts 'User Time: '
    #puts user_time
    #puts '---------------------'


    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @matches }
    end
  end

  # GET /matches/1
  # GET /matches/1.json
  def show
    match = Match.find(params[:id])


    matchTime = Time.current - match.date
    past = true
    if match.date > Time.current
      past = false
      local_time = distance_of_time_in_words(Time.current, match.date) + ' left'
    elsif matchTime > 0 and matchTime < 7200
      local_time = 'Match is in progress'
    else
      local_time = 'Match is over'
    end

    danger = (matchTime > -86400 and matchTime < 0 and Guess.where(match_id: match.id, user_id: current_user.id).count == 0)
    warning = (matchTime <= -86400 and Guess.where(match_id: match.id, user_id: current_user.id).count == 0)

    @match = Array.new
    @match = {
        id: match.id,
        team_a: match.team_a.name,
        team_b: match.team_b.name,
        team_a_short: match.team_a.short,
        team_b_short: match.team_b.short,
        stadium: match.stadium.name,
        city: match.stadium.city.name,
        country: match.stadium.city.country.code,
        tournament: match.tournament.name,
        stage: match.stage.name,
        date: match.date,
        timezone: match.timezone.name,
        pens: match.pens,
        goals_a: match.goals_a,
        goals_b: match.goals_b,
        pens_a: match.pens_a,
        pens_b: match.pens_b,
        coof_a: match.coof_a,
        coof_x: match.coof_x,
        coof_b: match.coof_b,
        local_time: local_time,
        past: past,
        warning: warning,
        danger: danger,
        guesses: Guess.where(match_id: match.id).order("points DESC"),
        my_guess: Guess.where(match_id: match.id, user_id: current_user.id)
    }

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @match }
    end
  end

  # GET /matches/new
  def new
    @match = Match.new
    @teams = Team.all.order("national ASC, name ASC")
    @stadiums = Stadium.all.order("name ASC")
    @tournaments = Tournament.all.order("name ASC")
    @stage = Stage.all
    @timezone = Timezone.all
  end

  # GET /matches/1/edit
  def edit
    @teams = Team.all.order("national ASC, name ASC")
    @stadiums = Stadium.all.order("name ASC")
    @tournaments = Tournament.all.order("name ASC")
    @stage = Stage.all
    @timezone = Timezone.all
  end

  # GET /matches/1/score
  def score
    @teams = Team.all.order("national ASC, name ASC")
    @stadiums = Stadium.all.order("name ASC")
    @tournaments = Tournament.all.order("name ASC")
    @stage = Stage.all
    @timezone = Timezone.all
  end

  # POST /matches
  # POST /matches.json
  def create
    @match = Match.new(match_params)

    respond_to do |format|
      if @match.save
        format.html { redirect_to @match, notice: 'Match was successfully created.' }
        format.json { render action: 'show', status: :created, location: @match }
      else
        format.html { render action: 'new' }
        format.json { render json: @match.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /matches/1
  # PATCH/PUT /matches/1.json
  def update


    if match_params[:goals_a] and match_params[:goals_b]

      if match_params[:goals_a] > match_params[:goals_b]
        actualResult = 1
      elsif match_params[:goals_a] < match_params[:goals_b]
        actualResult = 2
      else
        actualResult = 0
      end

      if match_params[:pens_a] and match_params[:pens_b]
        if match_params[:pens_a] > match_params[:pens_b]
          actualPens = 1
        elsif match_params[:pens_a] < match_params[:pens_b]
          actualPens = 2
        end
      end


      guesses = Guess.where(match_id: @match.id)

      # Recording Guess Points Started
      # Need to do penalties
      guesses.each do |guess|
        if guess.goals_a > guess.goals_b
          userResult = 1
        elsif guess.goals_a < guess.goals_b
          userResult = 2
        else
          userResult = 0
        end

        if guess.goals_a.to_s == match_params[:goals_a] and guess.goals_b.to_s == match_params[:goals_b]
          points = 3
        elsif userResult == actualResult
          points = 1
        else
          points = 0
        end

        if points > 0 and guess.pens_a and guess.pens_b

          if guess.pens_a > guess.pens_b
            userPens = 1
          elsif guess.pens_a < guess.pens_b
            userPens = 2
          end


          if guess.pens_a.to_s == match_params[:pens_a] and guess.pens_b.to_s == match_params[:pens_b]
            points += 3
          elsif userPens == actualPens
            points += 1
          end
        end


        if Guess.find(guess.id).update_attribute(:points, points)
          puts guess.user.setting.screen_name + ' got ' + points.to_s + ' points!'
        else
          puts 'DB recording failed'
        end
      end
      # Recording Guess Points Ended


      #puts YAML::dump(guesses);
    end

    respond_to do |format|
      if @match.update(match_params)
        format.html { redirect_to @match, notice: 'Match was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @match.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /matches/1
  # DELETE /matches/1.json
  def destroy
    @match.destroy
    respond_to do |format|
      format.html { redirect_to matches_url }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_match
    @match = Match.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def match_params
    params.require(:match).permit(:team_a, :team_b, :stadium, :tournament, :stage, :date, :timezone, :pens, :goals_a, :goals_b, :pens_a, :pens_b, :coof_a, :coof_x, :coof_b)
  end

  public
  attr_accessor :count
end
