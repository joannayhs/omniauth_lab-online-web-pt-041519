class SessionsController < ApplicationController
  def create
    if auth 
      @user = User.find_or_create_by(uid: auth['uid']) do |u|
        u.name = auth['info']['name']
        u.email = auth['info']['email']
      end
      session[:user_id] = @user.id 
      render 'welcome/home'
    end
  end

  private 

  def auth 
    request.env['omniauth.auth']
  end 
end
