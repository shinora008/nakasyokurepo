class RelationshipsController < ApplicationController
  before_action :logged_in_user

    def create
      @user = User.find(params[:favorites_id])
      current_user.favorite(@user)
      respond_to do |format|
        format.html { redirect_to @user }
        format.js
    end

    def destroy
      @user = User.find(params[:id]).favorite
      current_user.unfavorite(@user)
      respond_to do |format|
        format.html { redirect_to @user }
        format.js
      end
    end
  end
