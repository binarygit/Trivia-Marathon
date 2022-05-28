class VerdictsController < ApplicationController
  def create
    correct_answer = cookies[:correct_answer]
    answer = params[:commit]
    cookies.delete :question

    case answer
    when correct_answer
      flash.notice = 'That was correct!'
    else
      # reset num of questions answered
      cookies.delete :questions_answered
    end

    redirect_to root_path
  end
end
