class ToppagesController < ApplicationController
  def index
    if logged_in?
      @user = current_user
      @photo = current_user.photos.build
      @photos = Photo.all.order('created_at DESC')
    else
      @user = current_user
      @photos = Photo.all.order('created_at DESC')
    end
  end
end