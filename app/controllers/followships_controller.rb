class FollowshipsController < ApplicationController
  
  def create
    if current_user.blank?
      render plain: '401 Unauthorized', status: :unauthorized
    end

    user = User.find(params[:followee_id])
    current_user.follow(user)
    # respond_to do |format|
    #   format.html { redirect_to '/pages/favourite_users', locals: {user: user} }
    #   format.turbo_stream { render 'users/_unfollow.html.erb', locals: {user: user}}
    # end
    # redirect_to '/pages/favourite_users'
    respond_to do |format|   format.js {render inline: "location.reload();" } end 
  end

  def destroy
    user = Followship.find(params[:id]).followee
    current_user.unfollow(user)
    # respond_to do |format|
    #   format.html { redirect_to '/pages/favourite_users', locals: {user: user} }
    #   format.turbo_stream
    # end
    # redirect_to '/pages/favourite_users'
    # respond_to do |format|   format.js {render inline: "location.reload();" } end
    respond_to do |format|   format.js {render inline: "window.location.reload();" } end
  end
end