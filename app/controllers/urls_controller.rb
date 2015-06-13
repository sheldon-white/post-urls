class UrlsController < ApplicationController
  include ActionController::MimeResponds
  include ActionController::Helpers
  include ActionController::Cookies
  include ActionController::ImplicitRender
  
  # GET /urls
  # GET /urls.json
  def index
    @urls = Url.all

    render json: @urls
  end

  # GET /urls/1
  # GET /urls/1.json
  def show
    @url = Url.find(params[:id])

    render json: @url
  end

  # GET /urls/new
  # GET /urls/new.json
  def new
    @url = Url.new

    render json: @url
  end

  # POST /urls
  # POST /urls.json
  def create
    @url = Url.new(params[:url])

    if @url.save
      render json: @url, status: :created, location: @url
    else
      render json: @url.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /urls/1
  # PATCH/PUT /urls/1.json
  def update
    @url = Url.find(params[:id])

    if @url.update_attributes(params[:url])
      head :no_content
    else
      render json: @url.errors, status: :unprocessable_entity
    end
  end

  # DELETE /urls/1
  # DELETE /urls/1.json
  def destroy
    @url = Url.find(params[:id])
    @url.destroy

    head :no_content
  end
end
