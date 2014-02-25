class Admin::VideosController < Admin::ApplicationController
  before_filter :set_actor
  
  def create
    @video = Video.new
    @video.actor = @actor
    @video.video_id = params[:video_id]
    if @video.save
      redirect_to admin_actor_url(@actor), notice: 'Видео добавлено'
    else
      redirect_to admin_actor_url(@actor), notice: 'Не удалось добавить видео'
    end
  end

  def destroy
    video = Video.find(params[:id])
    video.destroy
    redirect_to admin_actor_url(@actor), notice: 'Видео удалено'
  end
  
  protected
  
  def set_actor
    @actor = Actor.find(params[:actor_id])
  end
end
