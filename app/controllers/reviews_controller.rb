class ReviewsController < ApplicationController

  def index
    @destination = Destination.find(params[:destination_id])
    @reviews = @destination.reviews
    json_response(@reviews)
  end

  def show
    @review = Review.find(params[:id])
    @destination = Destination.find(params[:id])
    response = HTTParty.get("http://localhost:3000/destinations/#{@destination.id}/reviews")
  end

  private


end
