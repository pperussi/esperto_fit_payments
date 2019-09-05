class  AdministratorController < ApplicationController
  before_action :authenticate_user!
  before_action :is_admin

  def index
    @payments = Payment.all
  end
  private
  def is_admin
    redirect_to root_path unless current_user.admin?
  end

end