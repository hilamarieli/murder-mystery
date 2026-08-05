class UsersController < ApplicationController
  before_action :require_admin

  def index
    @users = User.order(:name)
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end

  private

  def require_admin
    return if current_user.admin?

    redirect_to root_path, alert: "You are not authorized to manage users."
  end
end
