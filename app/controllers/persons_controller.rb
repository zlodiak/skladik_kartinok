class PersonsController < ApplicationController
  def profile
  end

  private 

    def person_params
      params.require(:person).permit(:name, :email, :password, :password_confirmation)
    end
end
