class ApplicationController < ActionController::Base
  require 'digest/sha1'

  protect_from_forgery

  helper :all

  helper_method :login?, :current_user

  def login?
    !session[:user_id].nil?
  end

  def current_user
    @current_user ||= User.find session[:user_id]
  end
  
  def log_in(user)
    user.last_login_time = Time.now
    user.last_login_ip = request.remote_ip
    user.perishable_token = generate_token
    user.save
    session[:user_token]  = user.perishable_token
    redirect_to('/')
  end
  
  def generate_token
     token ||= Digest::SHA1.hexdigest(rand(100000).to_s)
 end

  private

    def login_required
      unless login?
        redirect_to "/login?returnurl=#{request.path}"
      end
    end

end
