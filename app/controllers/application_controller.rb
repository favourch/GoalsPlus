class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate_user!

  before_filter :update_sanitized_params, if: :devise_controller?


  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end


  def update_sanitized_params
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:user_name, :email, :password, :password_confirmation) }
  end


  def main
    today = Time.current().to_s(:timestamp)


    m = Match.where("date > :date", {date: today}).order("date ASC").first
    @nextMatch = {
        id: m.id,
        team_a: m.team_a.name,
        team_b: m.team_b.name,
        short_a: m.team_a.short,
        short_b: m.team_b.short,
        location: m.stadium.name.to_s + ' (' + m.stadium.city.name.to_s + ', ' + m.stadium.city.country.code.to_s + ')',
        tournament: m.tournament.short.to_s + ', ' + m.stage.name,
        date: m.date.to_s(:game),
        pens: m.pens,
        goals_a: m.goals_a,
        goals_b: m.goals_b,
        pens_a: m.pens_a,
        pens_b: m.pens_b
    }

    m = Match.where("date <= :date", {date: today}).order("date DESC").first
    @lastMatch = {
        id: m.id,
        team_a: m.team_a.name,
        team_b: m.team_b.name,
        short_a: m.team_a.short,
        short_b: m.team_b.short,
        location: m.stadium.name.to_s + ' (' + m.stadium.city.name.to_s + ', ' + m.stadium.city.country.code.to_s + ')',
        tournament: m.tournament.short.to_s + ', ' + m.stage.name,
        date: m.date.to_s(:game),
        pens: m.pens,
        goals_a: m.goals_a,
        goals_b: m.goals_b,
        pens_a: m.pens_a,
        pens_b: m.pens_b
    }

    points = User.joins("LEFT JOIN `guesses` ON users.id = guesses.user_id")
    .select('users.*, count(guesses.user_id) as games, sum(guesses.points) as points')
    .group('users.id')
    .order("points DESC, games ASC")
    .limit(5);

    n = 0
    @standings = Array.new
    points.each do |p|
      n += 1
      @standings.push({
                          id: n,
                          user: p.setting.screen_name,
                          games: p.games,
                          points: p.points
                      })
    end
    puts YAML::dump(@standings);


  end

  protected
  def layout_by_resource
    if devise_controller?
      "devise"
    else
      "application"
    end
  end

end
