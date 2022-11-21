class Admin::TripsController < ApplicationController
  # Adminアカウントがログインしないと使えないようにする
  before_action :authenticate_admin!
  
  # 管理者側
  
  # すべてのデータを表示
  def index
    @trip = Trip.all.page(params[:page]).per(12)
    #@trips = params[:tag_id].present? ? Tag.find(params[:tag_id]).trips : Trip.all
    @trips = Trip.all.order(created_at: :desc)
  end

  # 一つずつ取り出す
  def show
    @trip = Trip.find(params[:id])
    @trip_comment = TripComment.new
  end


  # 投稿データのストロングパラメータ
  private

  def trip_params
    params.require(:trip).permit(:title, :image, :body, :star)
     #params.require(:trip).permit(:title, :image, :body, :star, tag_ids: [])
  end
end
