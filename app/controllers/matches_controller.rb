class MatchesController < ApplicationController

  def new
    fetch_question and set_cookies unless cookies[:question]

    @question = cookies[:question]
    @answers = JSON.parse cookies[:answers]
    @questions_answered = cookies[:questions_answered]
  end

  private

  def fetch_question
    url = URI("https://opentdb.com/api.php?amount=1&difficulty=#{difficulty_level}&type=multiple")
    json_response = Net::HTTP.get(url)
    @hash_response = JSON.parse(json_response)['results'].first
  end

  def set_cookies
    cookies[:answers] = @hash_response['incorrect_answers'].push(@hash_response['correct_answer']).shuffle
    cookies[:answers] = JSON.generate cookies['answers']

    cookies[:correct_answer] = @hash_response['correct_answer']
    cookies[:question] = @hash_response['question']

    cookies[:questions_answered] ||= 0
    cookies[:questions_answered] = cookies[:questions_answered].to_i + 1
  end

  def difficulty_level
    return 'easy' if @questions_answered.nil? || @questions_answered < 5
    return 'medium' if @questions_answered < 20
    return 'hard'
  end
end
