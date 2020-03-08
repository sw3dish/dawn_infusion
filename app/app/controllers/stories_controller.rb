class StoriesController < ApplicationController
  def index
    @stories = Story.all
  end

  def show
    @story = Story.find(params[:id])
  end

  def new
    @story = Story.new
  end

  def edit
    @story = Story.find(params[:id])
  end

  def create
    @story = Story.new(story_params)

    if @story.save
      redirect_to @story
    else
      render 'new'
    end
  end

  def update
    @story = Story.find(params[:id])
    permitted_params = story_params

    # if we pass validation
    if permitted_params
      # save the story in the DB
      @story.update(permitted_params)

      # if we should also interact with Lyra
      if params[:post_to_lyra] || params[:update_in_lyra]
        # set up our API wrapper
        lyra = Lyra.new('stories')
        # render the HTML to string
        html = render_to_string("show", {:layout => false})
        # inline the styles
        document = Roadie::Document.new(html)
        # ignore the media queries
        document.keep_uninlinable_css = false
        html_with_styles = document.transform

        # the data that will be sent using the API
        form_body = {
          title: permitted_params[:title],
          tag: permitted_params[:tag],
          html: html_with_styles
        }

        if params[:post_to_lyra]
          response = lyra.post(form_body)
          # update the story with the Lyra UUID
          @story.update(lyra_id: response['id'])
        else
          response = lyra.patch(@story.lyra_id, form_body)
        end
        render 'edit'
      # if not,
      else
        # show us the updated story
        redirect_to @story
      end
    # if we fail validation
    else
      # bring us back to the edit screen
      render 'edit'
    end
  end

  def destroy
    @story = Story.find(params[:id])
    @story.destroy

    redirect_to stories_path
  end

  def preview_lyra
    @story = Story.find(params[:id])

    if @story.lyra_id
      lyra = Lyra.new('stories')
      response = lyra.get(@story.lyra_id)

      @preview_html = response['attributes']['html'].html_safe
      render 'lyra'
    else
      render 'edit'
    end
  end

  def delete_lyra
    @story = Story.find(params[:id])

    if @story.lyra_id
      lyra = Lyra.new('stories')
      lyra.delete(@story.lyra_id)
      @story.update(lyra_id: nil)
    end
    render 'edit'
  end

  private

  def story_params
    params.require(:story).permit(:title, :html, :tag)
  end
end
