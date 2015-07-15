module SessionsHelper
  def admin_user
    if current_user
      unless current_user.admin?
        flash[:error] = "You are not admin"
        redirect_to root_path
      end
    else
      flash[:error] = "You are not logged"
      redirect_to root_path
    end
  end   
end
