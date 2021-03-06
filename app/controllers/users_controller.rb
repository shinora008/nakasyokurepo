class UsersController < ApplicationController
  before_action :logged_in_user, only: %i[index show edit update destroy]
  before_action :correct_user, only: %i[edit update]

  def index; end

  def show
    @user = User.find(params[:id])
    @reports = @user.reports.paginate(page: params[:page], per_page: 5)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'なか食レポへようこそ！'
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params_update)
      flash[:success] = 'プロフィールが更新されました!'
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    # 管理者ユーザーの場合
    if current_user.admin?
      @user.destroy
      flash[:success] = 'アカウントを削除しました'
      redirect_to root_url
    # 管理者ユーザーではないが、自分のアカウントの場合
    elsif current_user?(@user)
      @user.destroy
      flash[:success] = '自分のアカウントを削除しました'
      redirect_to root_url
    else
      flash[:danger] = '他のアカウントは削除できません'
      redirect_to root_url
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  # プロフィール編集時に許可する属性
  def user_params_update
    params.require(:user).permit(:name, :email, :introduction)
  end

  # 正しいユーザーかどうか確認
  def correct_user
    @user = User.find(params[:id])
    unless current_user?(@user)
      flash[:danger] = 'このページはアクセスできません'
      redirect_to(root_url)
    end
  end
end
