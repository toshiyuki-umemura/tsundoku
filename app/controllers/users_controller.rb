class UsersController < ApplicationController
  before_action :require_login, only: [:show]

  def show
    @books = current_user.books
  end
  private

  def require_login
    unless user_signed_in?
      redirect_to root_path
    end
  end

end
