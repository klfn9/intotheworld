class Public::TripCommentsController < ApplicationController

  # コメント保存
  def create
    @trip = Trip.find(params[:trip_id])
    @comment = current_user.trip_comments.new(trip_comment_params)
    @comment.trip_id = @trip.id
    if @comment.save
      flash.now[:notice] = 'コメントを投稿しました'
      render :comment  #render先にjsファイルを指定
    else
      render 'trips/show'
    end
  end

  # コメント削除
  def destroy
    TripComment.find(params[:id]).destroy
    #redirect_to trip_path(params[:trip_id])
    #renderしたときに@postのデータがないので@postを定義
    @trip = Trip.find(params[:trip_id])
    render :comment  #render先にjsファイルを指定
  end

  private

  def trip_comment_params
    params.require(:trip_comment).permit(:comment)
  end
end
