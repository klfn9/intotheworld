class Public::TripCommentsController < ApplicationController
  
  # コメント保存
  def create
    trip = Trip.find(params[:trip_id])
    comment = current_user.trip_comments.new(trip_comment_params)
    comment.trip_id = trip.id
    comment.save
  end
  
  # コメント削除
  def destroy
    TripComment.find(params[:id]).destroy
    redirect_to trip_path(params[:trip_id])
  end

  private

  def trip_comment_params
    params.require(:trip_comment).permit(:comment)
  end
end
