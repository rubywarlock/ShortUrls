class JobManagersController < ApplicationController
  before_action :set_job_manager, only: [:show, :edit, :update, :destroy]

  # GET /job_managers
  # GET /job_managers.json
  def index
    #@job_managers = Delayed::Job.all
    @job_managers = JobManager.all
  end

  # GET /job_managers/1
  # GET /job_managers/1.json
  def show
  end

  # GET /job_managers/new
  def new
    @job_manager = JobManager.new
  end

  # GET /job_managers/1/edit
  def edit
  end

  def update_status(status)
    @job_manager = JobManager.find(params[:id])
    respond_to do |format|
      if @job_manager.update_status(status: status)
        format.html { redirect_to @job_manager, notice: 'Job manager was successfully updated.' }
        format.json { render :show, status: :ok, location: @job_manager }
      else
        format.html { render :edit }
        format.json { render json: @job_manager.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /job_managers
  # POST /job_managers.json
  def create
    #TimeLogJob.set(wait: 2.seconds).perform_async

    @job_manager = JobManager.new(job_manager_params)

    respond_to do |format|
      if @job_manager.save
        format.html { redirect_to @job_manager, notice: 'Job manager was successfully created.' }
        format.json { render :show, status: :created, location: @job_manager }
      else
        format.html { render :new }
        format.json { render json: @job_manager.errors, status: :unprocessable_entity }
      end
    end


    #ShortUrlJob.set(wait: 1.minute).perform_later
    #redirect_to job_managers_path
    #ClearShortUrlsJob.set(wait: 1.minute).perform_later(ShortUrl.where('created_at >= ?', 1.minute.ago))

    #ShortUrl.where('created_at >= ?', 1.minute.ago) do |url|
    #  ClearShortUrlsJob.set(wait: 1.minute).perform_async(url)
    #end
  end

  # PATCH/PUT /job_managers/1
  # PATCH/PUT /job_managers/1.json
  def update
    respond_to do |format|
      if @job_manager.update(job_manager_params)
        format.html { redirect_to @job_manager, notice: 'Job manager was successfully updated.' }
        format.json { render :show, status: :ok, location: @job_manager }
      else
        format.html { render :edit }
        format.json { render json: @job_manager.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /job_managers/1
  # DELETE /job_managers/1.json
  def destroy
    @job_manager.destroy
    respond_to do |format|
      format.html { redirect_to job_managers_url, notice: 'Job manager was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job_manager
      @job_manager = JobManager.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_manager_params
      params.require(:job_manager).permit(:name, :job_task)
    end
end
