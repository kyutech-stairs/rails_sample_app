class TweetsController < ApplicationController
  def index 
    @tweets = Tweet.all
  end

  def show 
    @tweet = Tweet.find_by(id: params[:id])
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.save
      redirect_to tweets_path
    else
      render :new
    end
  end

  def edit
    @tweet = Tweet.find_by(id: params[:id])
  end

  def update
    @tweet = Tweet.find_by(id: params[:id])
  end

  def destroy
    @tweet = Tweet.find_by(id: params[:id])
    @tweet.destroy
    redirect_to tweets_path
  end

  

  private
    def tweet_params
      params.require(:tweet).permit(:body)
    end

end
