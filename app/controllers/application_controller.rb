class ApplicationController < ActionController::Base
   before_action :configure_permitted_parameters, if: :devise_controller?

   # ログインしたら投稿一覧ページへ
   def after_sign_in_path_for(resource)
     trips_path
   end
  
   # ログアウトしたら投稿一覧へ
   def after_sign_out_path_for(resource)
     trips_path
   end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
