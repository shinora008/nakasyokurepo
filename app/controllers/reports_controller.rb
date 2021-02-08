class ReportsController < ApplicationController
  before_action :logged_in_user
  def new
    @report = Report.new
  end

  def show
    @report = Report.find(params[:id])
  end

  def create
    @report = current_user.reports.build(report_params)
    if @report.save
      flash[:success] = 'レポートが投稿されました'
      # users/@user.idにとばせるようにする
      redirect_to report_path(@report)
    else
      render 'reports/new'
    end
  end

  def edit
    @report = Report.find(params[:id])
  end

  def update
    @report = Report.find(params[:id])
    if @report.update_attributes(report_params)
      flash[:success] = 'レポートが更新されました！'
      redirect_to @report
    else
      render 'edit'
    end
  end

  def destroy
    @report = Report.find(params[:id])
    if current_user.admin? || current_user?(@report.user)
      @report.destroy
      flash[:success] = 'レポートが削除されました'
      redirect_to request.referrer || root_url
    else
      flash[:denger] = '他のユーザーのレポートは削除できません'
      redirect_to root_url
    end
  end

  private
 
  def report_params
    params.require(:report).permit(:shop_id, :menu_id, :delivery_provider_id, :title, :comment)
  end
end
