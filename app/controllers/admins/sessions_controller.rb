class Admins::SessionsController < Devise::SessionsController

  def admin
    if current_user.setting.role.name != 'admin'
      redirect_to '/'
    end


    @new_users = User.joins(:setting).where(settings: {role_id: 3}).order('id ASC')
    @old_users = User.joins(:setting).where.not(settings: {role_id: 3}).order('id ASC')


  end
end