class FollowingsController < ApplicationController

  before_filter :authenticate_user!

  def create
    following = current_user.followeds.build(
                    :user_id => params[:follow])
    if following.save
      flash[:notice] = "Now following."
      redirect_to users_url
    else
      flash[:notice] = "Unable to follow."
      redirect_to users_url
    end
  end

  def destroy
    following = current_user.followeds.find(params[:id])
    following.destroy
    flash[:notice] = "Removed Follow."
    redirect_to users_url
  end

end
