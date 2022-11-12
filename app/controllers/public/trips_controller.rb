class Public::TripsController < ApplicationController

  # 空のインスタンスを生成
  def new
    @trip = Trip.new
  end

  # 投稿データの保存
  def create
    @trip = Trip.new(trip_params)
    @trip.user_id = current_user.id
    @trip.save
    # 一覧画面へ遷移
    redirect_to trips_path
  end

  # すべてのデータを表示
  def index
    @trips = Trip.all
  end

  # 一つずつ取り出す
  def show
    @trip = Trip.find(params[:id])
  end

  # 投稿編集
  def edit
    @trip= Trip.find(params[:id])
  end

  # 更新機能
  def update
    trip = Trip.find(params[:id])
    trip.update(trip_params)
    #詳細ページへ遷移
    redirect_to trip_path(trip.id)
  end
  
  # 削除機能
  def destroy
    trip = Trip.find(params[:id])
    trip.destroy
     # 一覧画面へ遷移
    redirect_to trip_path
  end


  # 投稿データのストロングパラメータ
  private

  def trip_params
    params.require(:trip).permit(:title, :image, :body)
  end
end
