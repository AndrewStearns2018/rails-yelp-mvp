class ReviewsController < ApplicationController

  def index
    @reviews = Review.restaurant.all
  end

  def new
    @restaurant = Restaurant.find(:restaurant_id)
    # Before creating the view, we need to indentify the specific restaurant
    # it is for in an instance variable that can be passed to the view
    # via the simple_form helper.
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    # We make a new instance of Review here.
    @review.restaurant = Restaurant.find(:restaurant_id)
    # We set the restaurant_id comolumn of that review to a specific restaurant.
    @review.save
    # We save that shit.
    # One can't use create because we need to set the restaurant_id column.
  end

  private

  def review_params
    params.require(:review).premit(:content, :rating)
  end
end
