class VerdictsController < ApplicationController
  def create
    correct_answer = cookies[:correct_answer]
    answer = params[:commit]

    case answer
    when correct_answer
      cookies.delete :question
      flash.notice = 'correct!'
    else
      flash.notice = 'incorrect!'
    end

    redirect_to root_path
  end
end
