class Public::TripsController < ApplicationController
  before_action :authenticate_user!,only: [:edit
]
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
    @trip.star_average = (@trip.star.to_f + @trip.star2.to_f + @trip.star3.to_f).fdiv(3).floor(1)
    if @trip.save
    # 一覧画面へ遷移
    redirect_to trips_path
    else
      render "new"
    end
  end

  # すべてのデータを表示
  def index
    @trips = if params[:tag_id].present?
      Tag.find(params[:tag_id]).trips
    elsif params[:latest]
      Trip.latest
    elsif params[:old]
      Trip.old
    elsif params[:star_count]
      Trip.star_count
    else
      Trip.all.order(created_at: :desc)
    end

    @trips = @trips.page(params[:page]).per(10)
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
    @trips = Trip.search(params[:keyword]).page(params[:page]).per(10)
    @keyword = params[:keyword]
    render "index"
  end


  # 投稿データのストロングパラメータ
  private

  def trip_params
    params.require(:trip).permit(:title, :image, :body, :star, :star2, :star3, tag_ids: [])
    #params.require(:trip).permit(:title, :image, :body, :star, tag_ids: [])
  end
end
