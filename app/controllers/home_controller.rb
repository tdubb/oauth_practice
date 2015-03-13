class HomeController < ApplicationController

  def index
  end

  def enter
    redirect_uri = "http://localhost:3000/user/auth/bedwatch/callback"
    site = "https://dev.bedwatch.com"
    client = OAuth2::Client.new(ENV["OAUTH_ID"], ENV["OAUTH_SECRET"], :site => site)
    @token = client.auth_code.get_token(params[:code], :redirect_uri => redirect_uri)
    user = @token.get("/api/user").parsed
    user = User.create(id: user["id"], email: user["email"])
    logger.debug {"========user========"}
    logger.debug {user}
    session[:user_id] = user.id
    # auth = request.env["omniauth.auth"]
    # user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)
    # session['oauth_token'] = @token
    # session[:user_id] = user.id
    # session[:access_token] = auth["credentials"]["token"]
    # redirect_to root_url, notice: "You have successfully logged in."
  end

  def show
    redirect_uri = "http://localhost:3000"
    client_id = "5432c96cc1254c5d7012a1ccc50e4922cf736f97225e84938f1b46219625bd8c"
    client_secret = "57433659ff27e94403ddfe96e34c1a1fa85a8cabe1b0b69d441ac5abdac6a662"
    site = "https://dev.bedwatch.com"
    client = OAuth2::Client.new(client_id, client_secret, :site => site)
    @token = client.auth_code.get_token(params[:code], :redirect_uri => redirect_uri)
  end

end
