class NewslettersController < ApplicationController
  def index
    @newsletters = Newsletter.all
  end

  def show
    @newsletter = Newsletter.find(params[:id])
  end

  def new
    @newsletter = Newsletter.new
    @stories = Story.all
  end

  def create
    @newsletter = Newsletter.new(newsletter_params)

    if @newsletter.save
      @newsletter.stories << Story.where(story_params)
      redirect_to @newsletter
    else
      render 'new'
    end
  end

  private

  def newsletter_params
    params.require(:newsletter).permit(:title, :publish_date)
  end

  def story_params
    params.require(:newsletter).permit(story_id: [])
  end
end
