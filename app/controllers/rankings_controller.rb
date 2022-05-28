class RankingsController < ApplicationController
  def index
    @rankings = Ranking.all.order(score: :desc)
  end

  def create
    @ranking = Ranking.new(attr_hash).save
    redirect_to rankings_path
  end

  private

  def attr_hash
    {name: params[:name], score: cookies[:total_score].to_i}
  end
end
