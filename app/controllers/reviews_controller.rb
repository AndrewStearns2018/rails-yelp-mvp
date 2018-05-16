class ReviewsController < ApplicationController

  def index
    @reviews = Review.restaurant.all
  end

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    # Before creating the view, we need to indentify the specific restaurant
    # it is for in an instance variable that can be passed to the view
    # via the simple_form helper.
    @review = Review.new
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    # We need the params, because this is the URL that has the id.
    @review = Review.new(review_params)
    @review.restaurant = @restaurant
    # Here is where we really hook up the review to the specific restaurant
    # that has been defined in line 19.
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
    # We make a new instance of Review here.
    # We set the restaurant_id comolumn of that review to a specific restaurant.
    # We save that shit.
    # One can't use create because we need to set the restaurant_id column.
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
