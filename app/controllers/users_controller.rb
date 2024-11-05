class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    user = User.find(params[:id])

    if user != current_user
      redirect_to root_path, alert: "You are not allowed to access this resource."
    end

    @created_events = user.created_events
  end
end
