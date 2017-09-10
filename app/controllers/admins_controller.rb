class AdminsController < ApplicationController
  before_action :authorize_admin!

  def index
    @users = User.all
  end

  private

  def authorize_admin!
    if !user_signed_in? || !current_user.admin?
      redirect_to new_admin_session_path, notice: "Please Login as Admin to view that page!"
    end
  end
end
