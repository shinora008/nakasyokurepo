class FavoritesController < ApplicationController
  before_action :logged_in_user

    def create
      @report = Report.find(params[:report_id])
      @user = @report.user
      current_user.favorite(@report)
      respond_to do |format|
        format.html { redirect_to request.referrer || root_url }
        format.js
    end
  end

    def destroy
      @report = Report.find(params[:report_id])
      current_user.favorites.find_by(report_id: @report.id).destroy
      respond_to do |format|
        format.html { redirect_to request.referrer || root_url }
        format.js
    end
  end
end
