class MatchesController < ApplicationController
  require "net/http"
  require "json"

  def new
    fetch_question and set_cookies unless cookies[:question]

    @question = cookies[:question]
    @answers = JSON.parse cookies[:answers]
  end

  private

  def fetch_question
    url = URI('https://opentdb.com/api.php?amount=1&category=9&difficulty=easy&type=multiple')
    json_response = Net::HTTP.get(url)
    @hash_response = JSON.parse(json_response)['results'].first
  end

  def set_cookies
    cookies[:answers] = @hash_response['incorrect_answers'].push(@hash_response['correct_answer']).shuffle
    cookies[:answers] = JSON.generate cookies['answers']
    cookies[:correct_answer] = @hash_response['correct_answer']
    cookies[:question] = @hash_response['question']
  end
end
