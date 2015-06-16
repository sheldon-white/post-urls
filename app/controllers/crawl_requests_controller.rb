class CrawlRequestsController < ApplicationController
  include ActionController::MimeResponds
  include ActionController::Helpers
  include ActionController::Cookies
  include ActionController::ImplicitRender
  
  # GET /crawl_requests
  # GET /crawl_requests.json
  def index
    @crawl_requests = CrawlRequest.all
    
    render json: @crawl_requests
  end

  # GET /crawl_requests/1
  # GET /crawl_requests/1.json
  def show
    @crawl_request = CrawlRequest.find(params[:id])

    render json: @crawl_request
  end

  # GET /crawl_requests/new
  # GET /crawl_requests/new.json
  def new
    @crawl_request = CrawlRequest.new

    render json: @crawl_request
  end

  # POST /crawl_requests
  # POST /crawl_requests.json
  def create
    @crawl_request = CrawlRequest.new(params[:crawl_request])
    @crawl_request.urls.build(params[:crawl_request][:urls_attributes])
    if @crawl_request.save
      render json: @crawl_request, status: :created, location: @crawl_request
    else
      render json: @crawl_request.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /crawl_requests/1
  # PATCH/PUT /crawl_requests/1.json
  def update
    @crawl_request = CrawlRequest.find(params[:id])

    if @crawl_request.update_attributes(params[:crawl_request])
      head :no_content
    else
      render json: @crawl_request.errors, status: :unprocessable_entity
    end
  end

  # DELETE /crawl_requests/1
  # DELETE /crawl_requests/1.json
  def destroy
    @crawl_request = CrawlRequest.find(params[:id])
    @crawl_request.destroy

    head :no_content
  end
private 
  def crawl_request_params
    params.require(:crawl_request).permit(:source, urls: [:crawl_request_id, :external_id, :url_text, :status, :created_at, :updated_at])
  end

end
