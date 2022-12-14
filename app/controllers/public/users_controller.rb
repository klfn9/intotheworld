class Public::UsersController < ApplicationController
  before_action :authenticate_user!,only: [:edit]
  #ユーザー側

  # ユーザー詳細
  def show
    @user = User.find(params[:id])
    @trip = @user.trips.order(created_at: :desc)
    
  end

  # ユーザー編集
  def edit
    @user = User.find(params[:id])
  end

  # ユーザー更新
  def update
    @user =User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  # 退会処理
  def withdraw
    @user = User.find(params[:id])
    # is_deletedカラムをtrueに変更することにより削除フラグを立てる
    @user.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to trips_path
  end

  # ストロングパラメータ
  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
end
