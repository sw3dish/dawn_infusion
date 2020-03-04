class NewslettersController < ApplicationController
  def index
    @newsletters = Newsletter.all
  end

  def show
    @newsletter = Newsletter.find(params[:id])
  end

  def new
    @newsletter = Newsletter.new
  end
end
