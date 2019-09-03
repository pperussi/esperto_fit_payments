class UserController < ApplicationController
  def index

    if (user_signed_in? && current_user.adm?)
      redirect_to administrator_index_path
    end
  end
end 