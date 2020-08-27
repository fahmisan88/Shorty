class LinksController < ApplicationController
  def show
    link = Link.find_by_slug(params[:slug])
    render nothing: true, status: 404 if link.nil?
    redirect_to link.url
  end

  def new
    @link = Link.new
  end

  def create
    @link = Link.new(link_params)

    if @link.save
      # flash[:notice] = 'Shorten Success!!'
      respond_to :js
    else
      flash[:alert] = @link.errors.full_messages.join(". ")
      redirect_to root_path
    end
  end

  private

  def link_params
    params.require(:link).permit(:url)
  end
end
