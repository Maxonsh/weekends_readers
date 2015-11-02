module AuthHelper
  def http_login
    username = Rails.application.secrets.user
    password = Rails.application.secrets.pass
    request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Basic.encode_credentials(username, password)
  end
end
