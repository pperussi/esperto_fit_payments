class RegistrationsController < ApplicationController

  def new 
    @registration = Registration.new
  end  

  def create

  end

  private
    def params_registration
      params.require(:registration).permit(:value)
    end
end