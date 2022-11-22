class Admin::TripsController < ApplicationController
  # Adminアカウントがログインしないと使えないようにする
  before_action :authenticate_admin!
  
  # 管理者側
  
  # すべてのデータを表示
  def index
    @trip = Trip.all.page(params[:page]).per(12)
    #@trips = params[:tag_id].present? ? Tag.find(params[:tag_id]).trips : Trip.all
    if params[:latest]
      @trips = Trip.latest
    elsif params[:old]
      @trips = Trip.old
    elsif params[:star_count]
      @trips = Trip.star_count
    else
    @trips = Trip.all.order(created_at: :desc)
    end
  end

  # 一つずつ取り出す
  def show
    @trip = Trip.find(params[:id])
    @trip_comment = TripComment.new
  end
  
  # 削除機能
  def destroy
    trip = Trip.find(params[:id])
    trip.destroy
     # 一覧画面へ遷移
    redirect_to admin_trips_path
  end


  # 投稿データのストロングパラメータ
  private

  def trip_params
    params.require(:trip).permit(:title, :image, :body, :star)
     #params.require(:trip).permit(:title, :image, :body, :star, tag_ids: [])
  end
end
