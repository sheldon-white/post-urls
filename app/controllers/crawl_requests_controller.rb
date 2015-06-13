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
    @crawl_request = CrawlRequest.new(crawl_request_params)

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

  def crawl_request_params
  # I want to accept a POST with nested attributes
  #  {
  #    "crawl_request": {
  #      "source": "postman",
  #      "urls_attributes": [
  #        {"url_text": "foo"},
  #        {"url_text": "baz"}
  #      ]
  #    }
  #  }

    # I've various things, without success...
    params.require(:crawl_request).require(:source).require(urls_attributes: [:url_text])

    #params.require(:crawl_request).require(:source urls_attributes: [ :url_text ])
    #params.require(:crawl_request => [ :source, { urls_attributes: :url_text } ])
  end

end
