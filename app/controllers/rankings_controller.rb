class RankingsController < ApplicationController
  def create
    @ranking = Ranking.new(attr_hash).save
    redirect_to root_path
  end

  private

  def attr_hash
    {name: params[:name], score: cookies[:total_score].to_i}
  end
end
