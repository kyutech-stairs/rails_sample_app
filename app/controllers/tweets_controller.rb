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
end
