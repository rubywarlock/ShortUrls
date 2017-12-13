class ShortUrlsController < ApplicationController
  before_action :set_short_url, only: [:show, :edit, :update, :destroy]

  def index
    @short_urls = request.path_info.include?('shared') ? ShortUrl.where(shared: true) : ShortUrl.all
    #@short_urls = request.path_info.include?('shared') ? ShortUrl.where(shared: true) : ShortUrl.all
  end

  def show
    redirect_to @short_url.original_url
  end

  def show_short_url
  end

  def new
    @short_url = ShortUrl.new
  end

  def edit
  end

  def create
    @short_url = ShortUrl.new(short_url_params)
    respond_to do |format|
      if @short_url.save
        format.html { redirect_to user_path(current_user), notice: 'Short url was successfully created.' }
        format.json { render :show, status: :created, location: cerrent_user }
      else
        format.html { render :new }
        format.json { render json: @short_url.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @short_url.update(short_url_params)
        format.html { redirect_to user_path(current_user), notice: 'Short url was successfully updated.' }
        format.json { render :show, status: :ok, location: cerrent_user }
      else
        format.html { render :edit }
        format.json { render json: @short_url.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @short_url.destroy
    respond_to do |format|
      format.html { redirect_to short_urls_url, notice: 'Short url was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_short_url
    @short_url = ShortUrl.find(params[:id])
  end

  def short_url_params
    params.require(:short_url).permit(:user_id, :shared, :original_url, :short_url)
  end
end
