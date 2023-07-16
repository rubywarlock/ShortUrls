class ShortUrlsController < ApplicationController
  before_action :set_short_url, only: [:show, :edit, :update, :destroy]

  def index
    # @short_urls = ShortUrl.where(shared: true)
    @short_urls = ShortUrl.shared
    #@short_urls = request.path_info.include?('shared') ? ShortUrl.where(shared: true) : ShortUrl.all
  end

  def show
  end

  def open
    if @short_url = ShortUrl.find_by(short_url: params[:short_url])
      redirect_to @short_url.original_url
    else
      redirect_to shared_urls_path
    end
  end

  def new
    @short_url = ShortUrl.new
  end

  def create
    @short_url = ShortUrl.new(url_params)

    respond_to do |format|
      if @short_url.save

        run_clean_job unless @short_url.permanent

        format.html { redirect_to user_path(current_user), notice: 'Short url was successfully created.' }
        format.json { render :show, status: :created, location: cerrent_user }
      else
        format.html { render :new }
        format.json { render json: @short_url.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @short_url.update(url_params)
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
      format.html { redirect_to shared_urls_path, notice: 'Short url was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def url_params
    params.require(:short_url).permit(:user_id, :shared, :permanent, :original_url)
  end

  def set_short_url
    @short_url = ShortUrl.find(params[:id])
  end

  def run_clean_job
    ShortUrlJob.set(wait: 1.minute).perform_later
  end
end
