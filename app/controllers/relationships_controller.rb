class RelationshipsController < ApplicationController
  before_action :logged_in_user

  def create
  	# instance variable used for ajax request
    @user = User.find(params[:followed_id])
    current_user.follow(@user)
    # required for ajax
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end

  def destroy
    @user = Relationship.find(params[:id]).followed
    current_user.unfollow(@user)
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end
end