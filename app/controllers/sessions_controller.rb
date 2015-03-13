# class SessionsController < ApplicationController
#   def create
#     redirect_uri = "http://localhost:3000/users/auth/bedwatch/callback"
#     site = "https://dev.bedwatch.com"
#     client = OAuth2::Client.new(ENV["OAUTH_ID"], ENV["OAUTH_SECRET"], :site => site)
#     @token = client.auth_code.get_token(params[:code], :redirect_uri => redirect_uri)
#     user = @token.get("/api/user").parsed
#     logger.debug {"=============I Alive=========="}
#     logger.debug {user}
#     @access_token ||= OAuth2::AccessToken.new(oauth_client, session[:access_token])
#     auth = request.env["rack.auth"]
#     logger.debug {@access_token.inspect}
#     user = User.find_by_id(user["id"]) || User.create(id: user["id"], email: ["email"])
#     session[:user_id] = user.id
#     session[:access_token] = @access_token
#     redirect_to root_url, notice: "You have successfully logged in."
#   end
#
#   def destroy
#     session[:user_id] = nil
#     session[:access_token] = nil
#     redirect_to root_url, notice: "Signed out."
#   end
#
# end
