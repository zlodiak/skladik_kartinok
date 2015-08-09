module SessionsHelper
  def admin_status
    if current_user
      if current_user.status_id == 3
        return true 
      else
        return nil
      end
    else
      return nil
    end    
  end

  def manager_status
    if current_user
      if current_user.status_id == 2
        return true 
      else
        return nil
      end
    else
      return nil
    end   
  end  

  def user_status
    if current_user
      if current_user.status_id == 1
        return true 
      else
        return nil
      end
    else
      return nil
    end  
  end   

  def guest_status
    if current_user
      return true
    else
      return false
    end
  end   

  def admin_check
    unless admin_status
      flash[:notice] = "Войдите в систему"
      redirect_to new_user_session_path      
    end
  end  

  def logged_check
    unless admin_status || manager_status || user_status
      flash[:notice] = "Войдите в систему"
      redirect_to new_user_session_path      
    end
  end   
end
