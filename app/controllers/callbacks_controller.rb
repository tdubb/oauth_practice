class CallbacksController < Devise::OmniauthCallbacksController
  def bedwatch
    logger.debug {"==========here in bedwatch==========="}
    logger.debug { request.env["omniauth.auth"].credentials.token}
    user = User.from_omniauth(request.env["omniauth.auth"])
    logger.debug {request.env["omniauth.auth"]}
    if user.persisted?
      flash.notice = "Signed in!"
      sign_in_and_redirect(user) and return
    else
      user.save
      flash.notice = "Created account!"
      sign_in_and_redirect(user) and return
    end
  end

end
