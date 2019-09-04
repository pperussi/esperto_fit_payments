class RegistrationController < ApplicationController
  def new
    @registration = Registration.new
  end

  def create
    @registration = Registration.new(require_params)
    if @registration.save!
      redirect_to @registration
    else
      flash[:alert] = 'Nao foi possivel salvar matricula'
      render :new
    end
  end

  def show
  end

  private

  def require_params
    params.require(:registration).permit(:name, :cpf, :unity, :plan)
  end


end
