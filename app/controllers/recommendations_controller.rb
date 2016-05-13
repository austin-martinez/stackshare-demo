class RecommendationsController < ApplicationController
  def index
    @tag_options = Tag.all.map { |tag| [tag.name, tag.id] }
  end

  def create
    redirect_to recommendation_path(tag_id: params[:tag_id])
  end

  def show
    @tag = Tag.find(params[:tag_id])
    rec = Recommendation.new(@tag.id)
    @top_tools = rec.top_tools
  end

end
