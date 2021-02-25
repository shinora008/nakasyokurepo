class ReportsController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :create, :new]
  def new
    @report = Report.new
    @report.build_menu
    @report.menu.build_shop
  end

  def show
    @report = Report.find(params[:id])
  end

  def create
    binding.pry
    if params[:report][:menu_attributes][:shop_attributes][:name].empty?
      params[:report][:menu_attributes].delete('shop_attributes')
      params[:report].delete('menu_attributes')
      @report = Report.new(report_params)
    else
      @report = Report.new(report_params)
    end
    respond_to do |format|
      if @report.save
        format.html { redirect_to @report, notice: 'Menu was successfully created.' }
        format.json { render :show, status: :created, location: @report }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
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
      redirect_to request.referrer == user_url(@report.user) ? user_url(@report.user) : root_url
    else
      flash[:denger] = '他のユーザーのレポートは削除できません'
      redirect_to root_url
    end
  end

  def index
    @report = Report.all
  end

  private

  def report_params
    params.require(:report).permit(:title, :comment, :delivery_provider_id, :picture, :menu_id, :evaluation, menu_attributes: [:id, :shop_id, :dish_name, :price, shop_attributes: %i[name address opening_hour]]).merge(user_id: current_user.id)
  end
end
