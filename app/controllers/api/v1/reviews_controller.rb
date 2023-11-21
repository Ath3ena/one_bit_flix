class Api::V1::ReviewsController < ApplicationController
  #skip_before_action :verify_authenticity_token

  def index
    @reviews = Review.where(reviewable_id: params[:id], reviewable_type: params[:type].capitalize!)
    render json: API::V1::ReviewSerializer.new(@reviews, include: params[:user]).serialized_json
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      render json: @review
    else
      render json: { errors: @review.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def review_params
    params.require(:review).permit(:reviwable_type, :reviewable_id, :rating, :description).merge(user: current_user)
  end
end
