class PersonsController < ApplicationController
  def profile
    redirect_to user_path(current_user)
  end

end
