module AuthHelper
  def http_login
    username = Rails.application.secrets.user
    password = Rails.application.secrets.pass
    access = ActionController::HttpAuthentication::Basic.encode_credentials(username, password)
    request.env['HTTP_AUTHORIZATION'] = access
  end
end
