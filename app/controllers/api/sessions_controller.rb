class Api::SessionsController < Api::ApplicationController
  def create
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      token = verifier.generate(user_id: user.id, expires_at: Time.now + 1.hour)
      render json: token, status: :ok
    else
      render json: { error: 'Wrong email or password' }, status: :unprocessable_entity
    end
  end
end
