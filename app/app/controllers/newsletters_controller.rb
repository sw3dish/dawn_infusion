require 'lyra'

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

  def edit
    @newsletter = Newsletter.find(params[:id])
  end

  def create
    @newsletter = Newsletter.new(newsletter_params)

    if @newsletter.save
      redirect_to @newsletter
    else
      render 'new'
    end
  end

  def update
    @newsletter = Newsletter.find(params[:id])
    permitted_params = newsletter_params

    # if we pass validation
    if permitted_params
      # save the newsletter in the DB
      @newsletter.update(permitted_params)

      # if we should interact with Lyra
      if params[:post_to_lyra] || params[:update_in_lyra]
        # create our API wrapper
        lyra = Lyra.new('newsletters')
        # render the HTML to string
        html = render_to_string("show", {:layout => false})
        # inline our styles
        document = Roadie::Document.new(html)
        # ignore media queries
        document.keep_uninlinable_css = false
        html_with_styles = document.transform

        # form data that will be sent
        form_body = {
          date: permitted_params[:publish_date],
          html: html_with_styles
        }

        if params[:post_to_lyra]
          response = lyra.post(form_body)
          # update the newsletter with the Lyra UUID
          @newsletter.update(lyra_id: response['id'])
        else
          response = lyra.patch(@newsletter.lyra_id, form_body)
        end

        render 'edit'
      # if not,
      else
        # show the updated newsletter
        redirect_to @newsletter
      end
    # if validation fails
    else
      # bring us back to the edit screen
      render 'edit'
    end
  end

  def destroy
    @newsletter = Newsletter.find(params[:id])
    @newsletter.destroy

    redirect_to newsletters_path
  end

  def preview_lyra
    @newsletter = Newsletter.find(params[:id])

    if @newsletter.lyra_id
      lyra = Lyra.new('newsletters')
      response = lyra.get(@newsletter.lyra_id)

      @preview_html = response['attributes']['html'].html_safe
      render 'lyra'
    end
  end

  def delete_lyra
    @story = Newsletter.find(params[:id])

    if @newsletter.lyra_id
      lyra = Lyra.new('newsletters')
      lyra.delete(@newsletter.lyra_id)
      @newsletter.update(lyra_id: nil)
    end
    render 'edit'
  end

  private

  def newsletter_params
    params.require(:newsletter).permit(:title, :publish_date, story_ids: [])
  end
end
