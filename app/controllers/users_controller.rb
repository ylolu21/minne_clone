class UsersController < ApplicationController
  def index
  end

  def update
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email)
  end
end
