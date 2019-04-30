class SongsController < ApplicationController
  # before_action :current_song, only: [:show, :edit, :update, :destroy]
  def index
    @songs = Song.all
  end

  def show
    current_song
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)

    if @song.save
      redirect_to @song
    else
      render :new
    end
  end

  def edit
    current_song
  end

  def update
    current_song
    @song.update(song_params)

    if @song.save
      redirect_to @song
    else
      render :edit
    end
  end

  def destroy
    current_song
    @song.destroy
    flash[:notice] = "Song deleted."
    redirect_to songs_path
  end

  private

  def song_params
    params.require(:song).permit(:title)
  end

  def current_song
    @song = Song.find(params[:id])
  end
end

