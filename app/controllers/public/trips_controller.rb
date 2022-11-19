class Public::TripsController < ApplicationController

  # ユーザー

  # 空のインスタンスを生成
  def new
    @trip = Trip.new
    @tags = Tag.all
    #byebug
  end

  # 投稿データの保存
  def create
    @trip = Trip.new(trip_params)
    @trip.user_id = current_user.id
    if @trip.save
    # 一覧画面へ遷移
    redirect_to trips_path
    else
      render "new"
    end
  end

  # すべてのデータを表示
  def index
    @trips = Trip.all
    @trips = params[:tag_id].present? ? Tag.find(params[:tag_id]).trips : Trip.all
  end

  # 一つずつ取り出す
  def show
    @trip = Trip.find(params[:id])
    @trip_comment = TripComment.new
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
    redirect_to trips_path
  end

  def search
    @trips = Trip.search(params[:keyword])
    @keyword = params[:keyword]
  render "index"
  end


  # 投稿データのストロングパラメータ
  private

  def trip_params
    params.require(:trip).permit(:title, :image, :body, :star, :star2, :star3)
    #params.require(:trip).permit(:title, :image, :body, :star, tag_ids: [])
  end
end
