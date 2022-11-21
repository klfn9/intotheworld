class Admin::UsersController < ApplicationController

  #管理者側
  before_action :authenticate_admin!

  # ユーザー一覧
  def index
    @user = User.all
     # ページネーションをつけたいデータに.page(params[:page])を追加
    @users = User.all.page(params[:page]).per(10)
  end

  # ユーザー詳細
  def show
    @user = User.find(params[:id])
    @trip = @user.trips
    @trip = Trip.all.order(created_at: :desc)
  end

  # 退会処理
  def withdraw
    @user = User.find(params[:id])
    # is_deletedカラムをtrueに変更することにより削除フラグを立てる
    @user.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to admin_users_path
  end

  # ストロングパラメータ
  def user_params
    params.require(:user).permit(:name, :email, :profile_image)
  end
end
