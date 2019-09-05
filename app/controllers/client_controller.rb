class ClientController < ApplicationController
  def new
  end

  
  def singleclass
    @client = Client.all
  end

  def search 
    @client = Client.where('name LIKE ?', "%#{params[:q]}%")
  end
end