module SessionsHelper
  def admin_status
    if current_user
      current_user.status == 3 ? return true : return nil
    else
      return nil
    end    
  end

  def manager_status
    if current_user
      current_user.status == 2 ? return true : return nil
    else
      return nil
    end  
  end  

  def user_status
    if current_user
      current_user.status == 1 ? return true : return nil
    else
      return nil
    end  
  end   

  def guest_status
    current_user ? return nil : return true 
  end   
end
