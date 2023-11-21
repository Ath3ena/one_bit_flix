class Api::V1::SeriesController < ApplicationController
  def show
    @serie = Serie.fin(params[:id])
    render json: Api::V1::SerieSerializer.new(@serie, include: params[:episodes], params: { user: current_user }).serialized_json
  end
end
