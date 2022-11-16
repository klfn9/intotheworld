class Public::SearchesController < ApplicationController
  
  def search
    @range = params[:range]
  end
end
