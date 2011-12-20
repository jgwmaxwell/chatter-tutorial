class UsersController < ApplicationController

  before_filter :authenticate_user!

  def index
    @users = User.includes(:followers).
                  where("id != ?", current_user.id).all
    @following = current_user.follows.all
  end

end
