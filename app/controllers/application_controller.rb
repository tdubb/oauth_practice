class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # logger.debug { "application controller" }
  #
  # rescue_from OAuth2::Error do |exception|
  #   if exception.response.status == 401
  #     session[:user_id] = nil
  #     session[:access_token] = nil
  #     redirect_to root_url, alert: "Access token expired, try signing in again."
  #   end
  # end
  #
  # private
  #
  # def oauth_client
  #   @oauth_client ||= OAuth2::Client.new(ENV["OAUTH_ID"], ENV["OAUTH_SECRET"], site: "https://dev.bedwatch.com")
  # end
  #
  # def access_token
  #   if session[:access_token]
  #     @access_token ||= OAuth2::AccessToken.new(oauth_client, session[:access_token])
  #   end
  # end
end
