class Api::ApplicationController < ApplicationController
  skip_before_action :verify_authenticity_token

  private

  def restrict_access
    authenticate_or_request_with_http_token do |authentication_token|
      begin 
        data = verifier.verify(authentication_token)
      rescue ActiveSupport::MessageVerifier::InvalidSignature
        invalid_token
      end

      verify_user(data) && verify_freshness(data) 
    end
  end

  def verifier
    ActiveSupport::MessageVerifier.new(Rails.application.secrets.secret_key_base)
  end

  def verify_user(data)
    @current_user = User.find(data[:user_id])
    @current_user
  end

  def verify_freshness(data)
    data[:expires_at] > Time.now
  end

  def invalid_token
    render json: 'HTTP Token: Access Denied.', status: :unauthorized
  end
end
