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
    today = Time.current().to_s(:db)


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
        dates: m.date.to_s(),
        pens: m.pens,
        score_a: (m.goals_a ? m.goals_a.to_s : '?') + (m.pens_a ? '(' + m.pens_a.to_s + ')' : ''),
        score_b: (m.goals_b ? m.goals_b.to_s : '?') + (m.pens_b ? '(' + m.pens_b.to_s + ')' : '')
    }

    m = Match.where("date < :date", {date: today}).order("date DESC").first
    @lastMatch = {
        id: m.id,
        team_a: m.team_a.name,
        team_b: m.team_b.name,
        short_a: m.team_a.short,
        short_b: m.team_b.short,
        location: m.stadium.name.to_s + ' (' + m.stadium.city.name.to_s + ', ' + m.stadium.city.country.code.to_s + ')',
        tournament: m.tournament.short.to_s + ', ' + m.stage.name,
        date: m.date.to_s(:game),
        dates: m.date.to_s(),
        pens: (m.pens_a and m.pens_b) ? '(pens)' : '',
        score_a: (m.goals_a ? m.goals_a.to_s : '?') + (m.pens_a ? '(' + m.pens_a.to_s + ')' : ''),
        score_b: (m.goals_b ? m.goals_b.to_s : '?') + (m.pens_b ? '(' + m.pens_b.to_s + ')' : '')
    }

    points = User.joins("LEFT JOIN (SELECT  `guesses`.`user_id` as `user_id` , `guesses`.`points` as `points`, `matches`.`date` as `date` FROM `matches`, `guesses` WHERE `guesses`.`match_id` = `matches`.`id` AND `matches`.`date` < '#{today}') as `g` ON users.id = g.user_id")
    .select('users.*, count(g.user_id) as games, sum(g.points) as points')
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


    @new_users = User.joins(:setting).where(settings: {role_id: 3})

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
