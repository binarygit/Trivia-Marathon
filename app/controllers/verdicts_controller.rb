class VerdictsController < ApplicationController
  def create
    correct_answer = cookies[:correct_answer]
    answer = params[:commit]
    cookies.delete :question

    case answer
    when correct_answer
      flash.notice = 'correct!'
    else
      cookies.delete :questions_answered
      flash.notice = 'incorrect!'
    end

    redirect_to root_path
  end
end
