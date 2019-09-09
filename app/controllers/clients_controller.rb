class ClientsController < ApplicationController
  def new
  end

  def singleclass
    @client = Client.all
  end

  def search 
    if params[:q]=! ""
      @client = Client.where('name LIKE ?', "%#{params[:q]}%")
    end

  end
end