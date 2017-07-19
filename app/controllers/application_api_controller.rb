class ApplicationApiController < ActionController::API
  include Response
  include ActionController::HttpAuthentication::Basic::ControllerMethods
  include ActionController::HttpAuthentication::Token::ControllerMethods
  # before_action :authenticate
  before_filter :restrict_access

  private
  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == "admin" && password == "secret"
    end
  end

  # def restrict_access
    # curl "http://localhost:3000/api/products/?access_token=52d350549a6f59da73978d20596bdc11"
  #   api_key = ApiKey.find_by access_token: params[:access_token]
  #   head :unauthorized unless api_key
  # end

  def restrict_access
    # curl "http://localhost:3000/api/products" -H 'Authorization: Token token="52d350549a6f59da73978d20596bdc11"'
    authenticate_or_request_with_http_token do |token, options|
      ApiKey.exists?(access_token: token)
    end
  end
end
