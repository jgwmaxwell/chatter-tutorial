class DashboardController < ApplicationController

  before_filter :authenticate_user!

  def index
    @posts = current_user.timeline
  end

end
