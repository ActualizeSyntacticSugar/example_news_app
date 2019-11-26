class Api::ArticlesController < ApplicationController
  def index
    # @articles = Article.all
    # render "index.json.jb"

    response = HTTP.get("https://newsapi.org/v2/everything?q=#{params[:input_search]}&apiKey=#{ENV["NEWS_API_KEY"]}")
    articles = response.parse["articles"]
    render json: { result: articles }
  end
end
