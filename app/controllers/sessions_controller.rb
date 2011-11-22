class SessionsController < ApplicationController
  def create
    provider = auth_hash["provider"]
    case provider
      when "github"
        @user = User.where(:github_uid => auth_hash["uid"]).first
        unless @user
          puts "Creating New User"
          @user = User.new
          @user.email        = auth_hash["extra"]["user_hash"]["email"] if auth_hash["extra"]["user_hash"]["email"]
          @user.name         = auth_hash["extra"]["user_hash"]["name"] if auth_hash["extra"]["user_hash"]["name"]
          @user.github_uid   = auth_hash["uid"] # Don't check because this shit is mandatory
          @user.github_token = auth_hash["credentials"]["token"]
          @user.github_name  = auth_hash["user_info"]["nickname"] if auth_hash["user_info"]["nickname"]
          
          @user.remote_avatar_url   = auth_hash["user_info"]["avatar_url"] if auth_hash["user_info"]["avatar_url"]
          @user.github_active = true
          @user.save
          
          log_in(@user)
        else
          log_in(@user)
        end
      when "google"
        # Google Auth
      when "twitter"
        # Twitter Auth
      else # The user isn't using Omniauth, handle appropriately
        puts "Provider (sessions#create): " + provider
    end
  end


  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
