class StoriesController < ApplicationController
  before_action :ensure_login, only: [ :new, :create ]

  def index
    # @stories=fetch_stories('votes_count>=5')
    @stories = Story.popular
  end

  def bin
    # @stories=fetch_stories('votes_count<5')
    @stories = Story.upcoming
    render action: 'index'
  end

  def new
    @story=Story.new
  end

  def create
    @story = @current_user.stories.build story_params
    if @story.save
      flash[:notice]='Story submission succeeded'
      redirect_to stories_path
    else
      render action:'new'
    end
  end

  def show
    @story = Story.find(params[:id])
  end

  def story_params
    params.require(:story).permit(:name, :link)
  end

  protected
  # def fetch_stories(conditions)
  #   @stories = Story.where(conditions).order("created_at DESC")
  # end
end
