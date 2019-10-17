# frozen_string_literal: true

class Admin::VideosController < Admin::BaseController
  def edit
    @video = Video.find(params[:id])
  end

  def update
    video = Video.find(params[:id])
    video.update(video_params)
  end

  def create
    tutorial  = Tutorial.find(params[:tutorial_id])
    thumbnail = YouTube::Video.by_id(new_video_params[:video_id]).thumbnail
    video = tutorial.videos.new(new_video_params.merge(thumbnail: thumbnail))

    if video.save
        flash[:success] = 'Successfully created video.'
        redirect_to edit_admin_tutorial_path(id: tutorial.id)
    else
      flash[:error] = video.errors.full_messages.to_sentence
      redirect_to edit_admin_tutorial_path(id: tutorial.id)
    end
  end

  private
  def video_params
    params.permit(:position)
  end

  def new_video_params
    params.require(:video).permit(:title, :description, :video_id, :thumbnail)
  end
end
