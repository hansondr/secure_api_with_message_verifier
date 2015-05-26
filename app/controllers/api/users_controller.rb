class Api::UsersController < Api::ApplicationController
  before_action :restrict_access

  def index
    render json: User.all, status: :ok
  end
end
