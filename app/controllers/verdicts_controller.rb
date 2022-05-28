class VerdictsController < ApplicationController
  def create
    correct_answer = cookies[:correct_answer]
    answer = params[:commit]
    cookies.delete :question

    case answer
    when correct_answer
      flash.notice = 'That was correct!'
    else
      set_cookies
      cookies.delete :questions_answered
      flash.alert = 'incorrect!'
    end

    redirect_to root_path
  end

  private

  def set_cookies
    cookies[:total_score] = cookies[:questions_answered]
    cookies[:correct_ans_for_prev_ques] = cookies[:correct_answer]
  end
end
