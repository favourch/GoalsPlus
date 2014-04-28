class Admins::SessionsController < Devise::SessionsController

  def admin
    if current_user.setting.role.name != 'admin'
      redirect_to '/'
    end


    @new_users = User.joins(:setting).where(settings: {role_id: 3})

    puts @new_users

  end
end