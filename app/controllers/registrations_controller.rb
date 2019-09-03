class RegistrationsController < ApplicationController
  def new
    @registrations = Registration.new
  end

  def create
    @registration = Registration.new(require_params)
    @registration.save!
    render @registration
  end

  def show
  end

  private

  def require_params
    params.require(:registration).permit(:name, :cpf, :unity, :plan)
  end


end
