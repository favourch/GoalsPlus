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
        host: m.host.name,
        visitor: m.visitor.name,
        short_a: m.host.short,
        short_b: m.visitor.short,
        location: m.stadium.name.to_s + ' (' + m.stadium.city.name.to_s + ', ' + m.stadium.city.country.code.to_s + ')',
        tournament: m.tournament.short.to_s + ', ' + m.stage.name,
        date: m.date.to_s(:game),
        dates: m.date.to_s(),
        pens: m.pens,
        score_a: (m.goals_a ? m.goals_a.to_s : '?') + (m.pens_a ? '(' + m.pens_a.to_s + ')' : ''),
        score_b: (m.goals_b ? m.goals_b.to_s : '?') + (m.pens_b ? '(' + m.pens_b.to_s + ')' : '')
    }

    m = Match.where("date < :date", {date: today}).order("date DESC").first

    if m == nil or m == ''
      @lastMatch = @nextMatch
    else
      @lastMatch = {
        id: m.id,
        host: m.host.name,
        visitor: m.visitor.name,
        short_a: m.host.short,
        short_b: m.visitor.short,
        location: m.stadium.name.to_s + ' (' + m.stadium.city.name.to_s + ', ' + m.stadium.city.country.code.to_s + ')',
        tournament: m.tournament.short.to_s + ', ' + m.stage.name,
        date: m.date.to_s(:game),
        dates: m.date.to_s(),
        pens: (m.pens_a and m.pens_b) ? '(pens)' : '',
        score_a: (m.goals_a ? m.goals_a.to_s : '?') + (m.pens_a ? '(' + m.pens_a.to_s + ')' : ''),
        score_b: (m.goals_b ? m.goals_b.to_s : '?') + (m.pens_b ? '(' + m.pens_b.to_s + ')' : '')
      }
    end

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

  def standings

    today = Time.current().to_s(:db)


    points = User.joins("LEFT JOIN (SELECT  `guesses`.`user_id` AS `user_id` , `guesses`.`points` AS `points`, `matches`.`date` AS `date` FROM `matches`, `guesses` WHERE `guesses`.`match_id` = `matches`.`id` AND `matches`.`date` < '#{today}') as `g` ON users.id = g.user_id")
    .select('users.*, COUNT(g.user_id) AS games, SUM(if(g.points = 3, 1, 0)) AS wins, SUM(if(g.points = 1, 1, 0)) AS draws, SUM(if(g.points = 0, 1, 0)) AS losses, SUM(g.points) AS points')
    .group('users.id')
    .order("points DESC, games ASC, wins DESC");

    n = 0
    @standings = Array.new
    points.each do |p|
      n += 1
      @standings.push({
                          id: n,
                          user: p.setting.screen_name,
                          games: p.games,
                          wins: p.wins,
                          draws: p.draws,
                          losses: p.losses,
                          points: p.points
                      })
    end


    points = User.select('u.id,
                          u.screen_name,
                          max(case when rn=1 then points end) m1,
                          max(case when rn=2 then points end) m2,
                          max(case when rn=3 then points end) m3,
                          max(case when rn=4 then points end) m4,
                          max(case when rn=5 then points end) m5,
                          SUM(m.points) points')
    .from("       (select users.id id, screen_name from users, settings where users.setting_id = settings.id) u
                          join (
                              select
                                user_id,
                                points,
                                @rn:=IF(user_id=@prevUserId,@rn+1,1) rn,
                                @prevUserId:=user_id,
                                m_date
                              from
                                 (select m.id match_id, guesses.id as g_id, points, user_id, date m_date
                                  from guesses, (select * from matches where date < '#{today}' order by date DESC limit 5) m
                                  where guesses.match_id = m.id order by m.date) t


                                join (select @prevUserId:= 0, @rn:= 0) g
                              order by user_id, m_date desc
                            ) m on u.id = m.user_id")
    .group('      u.id, u.screen_name')
    .order('      points DESC, m1 DESC, m2 DESC, m3 DESC, m4 DESC, m5 DESC')

    n = 0
    @last_form = Array.new
    points.each do |p|
      n += 1

      form = [p.m1, p.m2, p.m3, p.m4, p.m5].join(' ').gsub('4', 'W').gsub('6', 'W').gsub('3', 'W').gsub('2', 'D').gsub('1', 'D').gsub('0', 'L').split(' ');

      @last_form.push({
                          id: n,
                          user: p.screen_name,
                          form: form,
                          points: p.points

                      })
    end

  end

  def rules

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




